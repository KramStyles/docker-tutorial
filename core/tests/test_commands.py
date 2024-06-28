"""
Test custom Django management commands.
"""

from unittest.mock import patch

from django.core.management import call_command
from django.db.utils import OperationalError
from django.test import SimpleTestCase
from psycopg2 import OperationalError as Psycopg2Error


@patch("core.management.commands.wait_for_db.Command.check")
class CommandTests(SimpleTestCase):
    """Test commands."""

    def test_wait_for_db_ready(self, mock_check):
        """Test waiting for db if database is ready."""
        mock_check.return_value = True
        call_command("wait_for_db")
        mock_check.assert_called_once_with(databases=["default"])

    @patch("time.sleep")
    def test_wait_for_db_delay(self, mock_sleep, mock_check):
        """Test when OperationalError occurs."""
        # The first two times we call the mocked method,
        # We want it to raise the Psycog2 Error, three times
        # for the OperationalError and then pass finally
        mock_check.side_effect = [Psycopg2Error] * 2 + \
            [OperationalError] * 3 + [True]

        call_command("wait_for_db")
        self.assertEqual(mock_check.call_count, 6)
        mock_check.assert_called_with(databases=["default"])
