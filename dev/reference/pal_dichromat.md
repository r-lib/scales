# Dichromat (colour-blind) palette (discrete)

Dichromat (colour-blind) palette (discrete)

## Usage

``` r
pal_dichromat(name)

dichromat_pal(name)
```

## Arguments

- name:

  Name of colour palette. One of: `BrowntoBlue.10`, `BrowntoBlue.12`,
  `BluetoDarkOrange.12`, `BluetoDarkOrange.18`, `DarkRedtoBlue.12`,
  `DarkRedtoBlue.18`, `BluetoGreen.14`, `BluetoGray.8`,
  `BluetoOrangeRed.14`, `BluetoOrange.10`, `BluetoOrange.12`,
  `BluetoOrange.8`, `LightBluetoDarkBlue.10`, `LightBluetoDarkBlue.7`,
  `Categorical.12`, `GreentoMagenta.16`, `SteppedSequential.5`

## Examples

``` r
if (requireNamespace("dichromat", quietly = TRUE)) {
  show_col(pal_dichromat("BluetoOrange.10")(10))
  show_col(pal_dichromat("BluetoOrange.10")(5))

  # Can use with gradient_n to create a continuous gradient
  cols <- pal_dichromat("DarkRedtoBlue.12")(12)
  show_col(pal_gradient_n(cols)(seq(0, 1, length.out = 30)))
}


```
