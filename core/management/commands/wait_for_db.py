"""
Django command to wait for the database to be available.

Note:
    Because of the management package structure, django
    would let us run this command using manage.py
"""
import time

from django.core.management.base import BaseCommand
from django.db.utils import OperationalError
from psycopg2 import OperationalError as Psycopg2Error


class Command(BaseCommand):
    """Django command to wait for the database."""

    def handle(self, *args, **options):
        """Entry point for command."""
        self.stdout.write("Waiting for the database conn...")
        db_up = False
        while not db_up:
            try:
                self.check(databases=["default"])
                db_up = True
            except (Psycopg2Error, OperationalError):
                msg = "Database is unavailable. Waiting 1 Sec"
                self.stdout.write(self.style.WARNING(msg))
                time.sleep(1)

        self.stdout.write(self.style.SUCCESS("Database is ready!"))
