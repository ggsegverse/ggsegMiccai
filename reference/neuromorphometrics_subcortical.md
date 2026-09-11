# Neuromorphometrics Subcortical Atlas

Subcortical regions from the Neuromorphometrics maximum probability
tissue labels distributed with SPM12, derived from the MICCAI 2012 Grand
Challenge and Workshop on Multi-Atlas Labeling. Ventricles, white
matter, CSF and vessels are not included.

## Usage

``` r
neuromorphometrics_subcortical()
```

## Value

A
[ggseg.formats::ggseg_atlas](https://ggsegverse.github.io/ggseg.formats/reference/ggseg_atlas.html)
object (subcortical).

## Details

The label data are released under CC BY-NC. Credit the MRI scans as
originating from the OASIS project and the labeled data as "provided by
Neuromorphometrics, Inc. under academic subscription".

## References

Landman BA, Warfield SK (Eds.) (2012). *MICCAI 2012 Workshop on
Multi-Atlas Labeling*.

Marcus DS, et al. (2007). Open Access Series of Imaging Studies (OASIS):
cross-sectional MRI data in young, middle aged, nondemented, and
demented older adults. *Journal of Cognitive Neuroscience*,
19(9):1498-1507.
[doi:10.1162/jocn.2007.19.9.1498](https://doi.org/10.1162/jocn.2007.19.9.1498)

## See also

Other ggseg_atlases:
[`neuromorphometrics_cortical()`](https://ggsegverse.github.io/ggsegNeuromorphometrics/reference/neuromorphometrics_cortical.md)

## Examples

``` r
neuromorphometrics_subcortical()
#> 
#> ── neuromorphometrics_subcortical ggseg atlas ──────────────────────────────────
#> Type: subcortical
#> Regions: 14
#> Hemispheres: right, left, NA
#> Views: axial_1, axial_2, axial_3, axial_4, coronal_1, coronal_2, coronal_3,
#> sagittal
#> Palette: ✔
#> Rendering: ✔ ggseg
#> ✔ ggseg3d (meshes)
#> ────────────────────────────────────────────────────────────────────────────────
#>     hemi              region                     label
#> 1  right      accumbens area      Right_Accumbens_Area
#> 2   left      accumbens area       Left_Accumbens_Area
#> 3  right            amygdala            Right_Amygdala
#> 4   left            amygdala             Left_Amygdala
#> 5   <NA>          brain stem                Brain_Stem
#> 6  right             caudate             Right_Caudate
#> 7   left             caudate              Left_Caudate
#> 8  right cerebellum exterior Right_Cerebellum_Exterior
#> 9   left cerebellum exterior  Left_Cerebellum_Exterior
#> 10 right         hippocampus         Right_Hippocampus
#> ... with 14 more rows
```
