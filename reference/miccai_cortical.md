# MICCAI Cortical Atlas

Cortical regions from the Neuromorphometrics maximum probability tissue
labels distributed with SPM12, derived from the MICCAI 2012 Grand
Challenge and Workshop on Multi-Atlas Labeling. Projected onto the
fsaverage5 surface.

## Usage

``` r
miccai_cortical()
```

## Value

A
[ggseg.formats::ggseg_atlas](https://ggsegverse.github.io/ggseg.formats/reference/ggseg_atlas.html)
object (cortical).

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
[`miccai_subcortical()`](https://ggsegverse.github.io/ggsegMiccai/reference/miccai_subcortical.md)

## Examples

``` r
miccai_cortical()
#> 
#> ── miccai_cortical ggseg atlas ─────────────────────────────────────────────────
#> Type: cortical
#> Regions: 49
#> Hemispheres: left, right
#> Views: inferior, lateral, medial, superior
#> Palette: ✔
#> Rendering: ✔ ggseg
#> ✔ ggseg3d (vertices)
#> ────────────────────────────────────────────────────────────────────────────────
#>    hemi                   region                                 label
#> 1  left anterior cingulate gyrus lh_Left_ACgG_anterior_cingulate_gyrus
#> 2  left          anterior insula          lh_Left_AIns_anterior_insula
#> 3  left   anterior orbital gyrus   lh_Left_AOrG_anterior_orbital_gyrus
#> 4  left            angular gyrus             lh_Left_AnG_angular_gyrus
#> 5  left         calcarine cortex         lh_Left_Calc_calcarine_cortex
#> 6  left        central operculum          lh_Left_CO_central_operculum
#> 7  left                   cuneus                    lh_Left_Cun_cuneus
#> 8  left          entorhinal area           lh_Left_Ent_entorhinal_area
#> 9  left        frontal operculum          lh_Left_FO_frontal_operculum
#> 10 left             frontal pole              lh_Left_FRP_frontal_pole
#> ... with 92 more rows
```
