# ABOUTME: Tests for the legacy SQL import management command.
# ABOUTME: Covers SQL parsing, category mapping, external honors, and dirty data handling.

import tempfile
import textwrap

import pytest
from django.core.management import call_command

from op.management.commands.import_legacy_sql import parse_insert_values, decode_legacy_text
from django.contrib.auth import get_user_model

from op.models import (
    AlternateName,
    Bestowal,
    Event,
    Group,
    Honor,
    Recipient,
    Recommendation,
    SiteConfig,
)

User = get_user_model()


SAMPLE_SQL = textwrap.dedent("""\
    -- phpMyAdmin SQL Dump

    CREATE TABLE `op_groups` (
      `groupID` int(11) NOT NULL auto_increment,
      `groupName` varchar(120) NOT NULL,
      `groupDesignator` varchar(120) default NULL,
      PRIMARY KEY  (`groupID`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8;

    INSERT INTO `op_groups` VALUES (1, 'Havenholde', 'Marche of');
    INSERT INTO `op_groups` VALUES (2, 'Hawkes Keye', 'Marche of');

    CREATE TABLE `op_honors` (
      `honorkey` int(11) NOT NULL auto_increment,
      `honor` varchar(120) NOT NULL,
      `type` varchar(30) default NULL,
      `description` text,
      `abbrev` varchar(15) default NULL,
      `level` int(11) NOT NULL default '0',
      `status` tinyint(1) NOT NULL default '1',
      `catagory` varchar(10) default NULL,
      `rec` tinyint(1) NOT NULL default '1',
      PRIMARY KEY  (`honorkey`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8;

    INSERT INTO `op_honors` VALUES (190, 'Flaming Brand', 'Award of the', 'Given for service.', 'AFB', 50, 1, 'BAR', 1);
    INSERT INTO `op_honors` VALUES (222, 'Baronial Champion', NULL, 'Chosen by contest.', NULL, 0, 1, 'FGCH', 0);
    INSERT INTO `op_honors` VALUES (296, 'Baronial Gaming Champion', '', 'Gaming champ.', '', 0, 1, 'bfg', 0);

    CREATE TABLE `op_recipients` (
      `reckey` int(11) unsigned NOT NULL auto_increment,
      `scaname` varchar(250) default NULL,
      `mname` varchar(250) default NULL,
      `gender` enum('M','F') default NULL,
      `active` tinyint(1) NOT NULL default '1',
      `name_registered` tinyint(1) NOT NULL default '0',
      `device_registered` tinyint(1) NOT NULL default '0',
      `device_blazon` text,
      PRIMARY KEY  (`reckey`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8;

    INSERT INTO `op_recipients` VALUES (22, 'Bearengaer hinn Raudi', 'Tony Lackey', 'M', 0, 1, 1, 'Per pale azure and Or');
    INSERT INTO `op_recipients` VALUES (64, 'Brusten de Bearsul', 'Patrick Smith', 'M', 1, 0, 0, NULL);

    CREATE TABLE `op_altnames` (
      `ID` int(11) NOT NULL auto_increment,
      `reckey` int(11) NOT NULL default '0',
      `altname` varchar(120) NOT NULL,
      `nickname` tinyint(1) NOT NULL default '0',
      `formername` tinyint(1) NOT NULL default '1',
      `registered` tinyint(1) NOT NULL default '0',
      PRIMARY KEY  (`ID`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8;

    INSERT INTO `op_altnames` VALUES (46, 28, 'Anne Winterskye', 1, 0, 0);
    INSERT INTO `op_altnames` VALUES (282, 693, '', 1, 0, 0);

    CREATE TABLE `op_calendar` (
      `eventID` int(11) NOT NULL auto_increment,
      `event` varchar(120) NOT NULL,
      `date` date NOT NULL,
      PRIMARY KEY  (`eventID`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8;

    INSERT INTO `op_calendar` VALUES (1, 'Push for Pennsic', '2011-07-09');

    CREATE TABLE `op_bestowals` (
      `ID` int(11) unsigned NOT NULL auto_increment,
      `sortdate` date default NULL,
      `sequence` varchar(5) default NULL,
      `dispdate` varchar(13) default NULL,
      `event` varchar(50) default NULL,
      `reckey` int(11) unsigned NOT NULL,
      `honorkey` int(11) unsigned NOT NULL,
      `notes` varchar(255) default NULL,
      PRIMARY KEY  (`ID`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8;

    INSERT INTO `op_bestowals` VALUES (1, '1970-12-31', '', '?', NULL, 22, 190, '(1st Midrealm Court Baronage)');
    INSERT INTO `op_bestowals` VALUES (7, '1972-10-28', '.01', NULL, NULL, 22, 167, '');
    INSERT INTO `op_bestowals` VALUES (2071, NULL, NULL, NULL, NULL, 0, 0, NULL);
    INSERT INTO `op_bestowals` VALUES (2068, '2018-07-07', NULL, NULL, NULL, 64, 0, NULL);

    CREATE TABLE `op_configuration` (
      `key` varchar(20) NOT NULL,
      `value` varchar(255) NOT NULL,
      PRIMARY KEY  (`key`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8;

    INSERT INTO `op_configuration` VALUES ('adminName', 'Dafydd Blaidd');
    INSERT INTO `op_configuration` VALUES ('adminEmail', 'dafydd@midrealm.org');
    INSERT INTO `op_configuration` VALUES ('groupNameShort', 'Flaming Gryphon');
    INSERT INTO `op_configuration` VALUES ('groupNameLong', 'The Barony of the Flaming Gryphon');
    INSERT INTO `op_configuration` VALUES ('coronet', 'Edward and Allegra');
    INSERT INTO `op_configuration` VALUES ('libdir', 'libs');

    CREATE TABLE `op_honorimages` (
      `imageID` bigint(20) unsigned NOT NULL auto_increment,
      `honorkey` int(11) NOT NULL,
      `filename` varchar(255) NOT NULL,
      `mime_type` varchar(255) NOT NULL,
      `file_size` int(11) NOT NULL,
      `file_data` longblob NOT NULL,
      PRIMARY KEY  (`imageID`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8;

    CREATE TABLE `op_recommendations` (
      `recID` int(11) NOT NULL auto_increment,
      `yourtitle` varchar(120) default NULL,
      `yourscaname` varchar(250) NOT NULL,
      `yourmname` varchar(250) default NULL,
      `youremail` varchar(250) NOT NULL,
      `title` varchar(120) default NULL,
      `scaname` varchar(250) NOT NULL,
      `mname` varchar(250) default NULL,
      `shire` varchar(30) default NULL,
      `gender` enum('M','F') default NULL,
      `minor` tinyint(1) NOT NULL default '0',
      `honorkey` int(11) NOT NULL,
      `recdate` date NOT NULL,
      `deserve` text,
      `given` tinyint(1) NOT NULL default '0',
      PRIMARY KEY  (`recID`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8;

    INSERT INTO `op_recommendations` VALUES (14, 'Mistress', 'Gwyneth Banfhidhleir', 'Ginny Beatty', 'ginbeatty@gmail.com', 'Sir', 'Lothar Nachtshatten', 'Walter Kinzel', 'Out of Barony', 'M', 0, 190, '2017-06-15', 'Sir Lothar has served &quot;admirably&quot; for many years.', 0);
    INSERT INTO `op_recommendations` VALUES (16, 'Baron', 'Gavin MacFergus', 'Ronnie McCormack', 'ron@yahoo.com', 'Lady', 'Astrid', 'Val Barr', 'Unicorn', 'F', 0, 190, '2017-08-09', 'Astrid is a treasure to the barony.', 1);
    INSERT INTO `op_recommendations` VALUES (99, NULL, 'Spammer', NULL, 'spam@example.com', NULL, 'Buy Stuff', NULL, NULL, NULL, 0, 190, '2018-01-01', 'Visit http://spam.example.com for great deals!', 0);

    CREATE TABLE `op_recevents` (
      `recID` int(11) NOT NULL,
      `eventID` int(11) NOT NULL,
      PRIMARY KEY  (`recID`,`eventID`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8;

    INSERT INTO `op_recevents` VALUES (14, 1);
    INSERT INTO `op_recevents` VALUES (16, 1);
""")


class TestParseInsertValues:
    def test_simple_values(self):
        line = "INSERT INTO `op_groups` VALUES (1, 'Havenholde', 'Marche of');"
        result = parse_insert_values(line)
        assert result == ["1", "Havenholde", "Marche of"]

    def test_null_values(self):
        line = "INSERT INTO `op_recipients` VALUES (64, 'Brusten', NULL, 'M', 1, 0, 0, NULL);"
        result = parse_insert_values(line)
        assert result == ["64", "Brusten", None, "M", "1", "0", "0", None]

    def test_escaped_quotes(self):
        line = "INSERT INTO `op_honors` VALUES (191, 'Gryphon''s Plume', 'Award of the', '', '', 50, 1, 'BAR', 1);"
        result = parse_insert_values(line)
        assert result[1] == "Gryphon's Plume"

    def test_empty_string(self):
        line = "INSERT INTO `op_bestowals` VALUES (1, '1970-12-31', '', '?', NULL, 22, 190, '');"
        result = parse_insert_values(line)
        assert result[2] == ""
        assert result[7] == ""


class TestDecodeLegacyText:
    def test_html_entities(self):
        assert decode_legacy_text("&quot;hello&quot;") == '"hello"'
        assert decode_legacy_text("&amp;") == "&"

    def test_escaped_quotes(self):
        assert decode_legacy_text("Dafydd\\'s") == "Dafydd's"
        assert decode_legacy_text("Dafydd\\''s") == "Dafydd's"

    def test_none_passthrough(self):
        assert decode_legacy_text(None) is None

    def test_plain_text(self):
        assert decode_legacy_text("hello world") == "hello world"


@pytest.mark.django_db
class TestImportCommand:
    def _run_import(self, sql_content=SAMPLE_SQL):
        with tempfile.NamedTemporaryFile(mode="w", suffix=".sql", delete=False) as f:
            f.write(sql_content)
            f.flush()
            call_command("import_legacy_sql", f.name, verbosity=0)

    def test_imports_groups(self):
        self._run_import()
        assert Group.objects.count() == 2
        assert Group.objects.get(name="Havenholde").designator == "Marche of"

    def test_imports_honors_with_category_mapping(self):
        self._run_import()
        fb = Honor.objects.get(legacy_key=190)
        assert fb.name == "Flaming Brand"
        assert fb.prefix == "Award of the"
        assert fb.category == Honor.Category.BARONIAL
        assert fb.accepts_recommendations is True
        assert fb.is_active is True

        champ = Honor.objects.get(legacy_key=222)
        assert champ.category == Honor.Category.CHAMPION
        assert champ.accepts_recommendations is False

    def test_bfg_category_mapped_to_baronial(self):
        self._run_import()
        gaming = Honor.objects.get(legacy_key=296)
        assert gaming.category == Honor.Category.BARONIAL

    def test_imports_recipients(self):
        self._run_import()
        assert Recipient.objects.count() == 2
        r = Recipient.objects.get(sca_name="Bearengaer hinn Raudi")
        assert r.mundane_name == "Tony Lackey"
        assert r.gender == "M"
        assert r.active is False
        assert r.name_registered is True
        assert r.device_blazon == "Per pale azure and Or"

    def test_skips_empty_altnames(self):
        self._run_import()
        # Row 282 has empty name — should be skipped
        # Row 46 references reckey=28 which doesn't exist in sample — also skipped
        assert AlternateName.objects.count() == 0

    def test_imports_events(self):
        self._run_import()
        assert Event.objects.count() == 1
        e = Event.objects.first()
        assert e.name == "Push for Pennsic"

    def test_imports_bestowals(self):
        self._run_import()
        # Row 1: valid bestowal with local honor
        # Row 7: external honor 167 — creates placeholder
        # Row 2071: fully null — skipped
        # Row 2068: honorkey=0 — skipped
        assert Bestowal.objects.count() == 2

    def test_creates_external_honor_placeholder(self):
        self._run_import()
        ext = Honor.objects.get(legacy_key=167)
        assert ext.is_external is True
        assert ext.category == Honor.Category.EXTERNAL
        assert "167" in ext.name

    def test_skips_null_bestowal_row(self):
        self._run_import()
        # Row 2071 has NULL sortdate, reckey=0, honorkey=0
        assert not Bestowal.objects.filter(sort_date__isnull=True).exists()

    def test_skips_honorkey_zero(self):
        self._run_import()
        # Row 2068 has honorkey=0
        assert not Honor.objects.filter(legacy_key=0).exists()

    def test_imports_site_config(self):
        self._run_import()
        config = SiteConfig.load()
        assert config.admin_name == "Dafydd Blaidd"
        assert config.admin_email == "dafydd@midrealm.org"
        assert config.group_name_short == "Flaming Gryphon"
        assert config.coronet == "Edward and Allegra"

    def test_imports_recommendations(self):
        self._run_import()
        # 3 rows in sample: 14 (normal), 16 (given=1), 99 (spam — skipped)
        assert Recommendation.objects.count() == 2

    def test_recommendation_given_status(self):
        self._run_import()
        rec16 = Recommendation.objects.get(nominee_sca_name="Astrid")
        assert rec16.status == Recommendation.Status.GIVEN

    def test_recommendation_pending_status(self):
        self._run_import()
        rec14 = Recommendation.objects.get(nominee_sca_name="Lothar Nachtshatten")
        assert rec14.status == Recommendation.Status.PENDING

    def test_recommendation_legacy_fields(self):
        self._run_import()
        rec14 = Recommendation.objects.get(nominee_sca_name="Lothar Nachtshatten")
        assert rec14.legacy_recommender_sca_name == "Gwyneth Banfhidhleir"
        assert rec14.legacy_recommender_email == "ginbeatty@gmail.com"
        assert rec14.legacy_recommender_title == "Mistress"

    def test_recommendation_html_decoded(self):
        self._run_import()
        rec14 = Recommendation.objects.get(nominee_sca_name="Lothar Nachtshatten")
        assert '"admirably"' in rec14.justification

    def test_recommendation_spam_skipped(self):
        self._run_import()
        assert not Recommendation.objects.filter(nominee_sca_name="Buy Stuff").exists()

    def test_recommendation_system_user_created(self):
        self._run_import()
        assert User.objects.filter(username="legacy_import_system").exists()

    def test_recommendation_linked_to_event(self):
        self._run_import()
        rec14 = Recommendation.objects.get(nominee_sca_name="Lothar Nachtshatten")
        # recevents links recID=14 to eventID=1 (Push for Pennsic)
        assert rec14.scheduled_event is not None
        assert rec14.scheduled_event.name == "Push for Pennsic"
