"""Using SimpleTestCase because of no database call."""

from django.test import SimpleTestCase

from core import sample

# Create your tests here.


class TestCalc(SimpleTestCase):
    """Test the Calc function."""

    def test_add_numbers(self):
        """Test adding numbers together."""
        res = sample.add(4, 56)
        self.assertEqual(res, 60)

    def test_substract_numbers(self):
        """Test substract numbers."""
        result = sample.substract(10, 20)
        self.assertEqual(result, 10)
