/// The canonical blood-type codes (as used by the API) and their display
/// labels. Single source of truth — do not redefine these per screen.
const bloodTypes = [
  'A_POS',
  'A_NEG',
  'B_POS',
  'B_NEG',
  'AB_POS',
  'AB_NEG',
  'O_POS',
  'O_NEG',
];

/// Maps an API blood-type code to its human label (e.g. `A_POS` → `A+`).
/// Returns [value] unchanged if it isn't a known code.
String bloodTypeLabel(String value) {
  return switch (value) {
    'A_POS' => 'A+',
    'A_NEG' => 'A-',
    'B_POS' => 'B+',
    'B_NEG' => 'B-',
    'AB_POS' => 'AB+',
    'AB_NEG' => 'AB-',
    'O_POS' => 'O+',
    'O_NEG' => 'O-',
    _ => value,
  };
}
