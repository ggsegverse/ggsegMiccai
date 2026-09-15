# Create MICCAI Brain Atlas
#
# Source: SPM12 tpm/labels_Neuromorphometrics.nii and .xml
#   https://github.com/spm/spm12/tree/main/tpm
# Labels: maximum probability tissue labels derived from the MICCAI 2012
#   Grand Challenge and Workshop on Multi-Atlas Labeling.
# License: CC BY-NC. MRI scans originate from the OASIS project
#   (https://www.oasis-brains.org/); labeled data "provided by
#   Neuromorphometrics, Inc. (http://Neuromorphometrics.com/) under academic
#   subscription".
# Date obtained: 2026-09-10
#
# Run with: Rscript data-raw/make_atlas.R

library(ggseg.extra)
library(ggseg.formats)

Sys.setenv(FREESURFER_HOME = "/Applications/freesurfer/7.4.1")

source(here::here("data-raw", "miccai_lut.R"))

source_dir <- here::here("data-raw", "source")
dir.create(source_dir, showWarnings = FALSE, recursive = TRUE)
for (source_file in c(
  "labels_Neuromorphometrics.nii",
  "labels_Neuromorphometrics.xml"
)) {
  destination <- file.path(source_dir, source_file)
  if (!file.exists(destination)) {
    utils::download.file(
      paste0(
        "https://raw.githubusercontent.com/spm/spm12/main/tpm/",
        source_file
      ),
      destination,
      mode = "wb"
    )
  }
}

lut <- miccai_lut(
  file.path(source_dir, "labels_Neuromorphometrics.xml")
)

atlases <- create_wholebrain_from_volume(
  input_volume = here::here(
    "data-raw",
    "source",
    "labels_Neuromorphometrics.nii"
  ),
  input_lut = lut,
  atlas_name = "miccai",
  output_dir = "data-raw",
  skip_existing = TRUE,
  cleanup = FALSE
)

vermis_regions <- c(
  "cerebellar vermal lobules i v" = "cerebellar vermal lobules I-V",
  "cerebellar vermal lobules vi vii" = "cerebellar vermal lobules VI-VII",
  "cerebellar vermal lobules viii x" = "cerebellar vermal lobules VIII-X"
)

.miccai_cortical <- atlases$cortical |>
  atlas_simplify(keep = 0.2) |>
  atlas_region_rename("^\\S+ ", "")

# The subcortical atlas is two kinds of geometry in one object, and they want
# opposite treatment, so they are polished separately rather than in one pass.
#
# The `cortex_` silhouette is anatomical context: what makes it readable as a
# brain is its sulcal and gyral shape, which is fine-scale detail. It keeps half
# its vertices and is rounded with `chaikin`, which moves vertices rather than
# growing the shape, so the marching-squares staircase goes without the sulci
# going with it - `atlas_smooth()`'s default `close` fills anything narrower
# than the smoothing distance, and a sulcus is exactly that.
#
# The structures are small, compact and carry no fine detail worth keeping, so
# they simplify harder and are smoothed with `close`, which is what rounds a
# marching-squares parcel into a recognisable nucleus.
.miccai_subcortical <- atlases$subcortical |>
  atlas_region_rename(
    "^cerebellar vermal lobules",
    function(region) unname(vermis_regions[region])
  ) |>
  atlas_region_rename("^ventral dc$", "ventral DC") |>
  atlas_simplify(keep = 0.5, labels = "^cortex") |>
  atlas_smooth(smoothness = 0.35, labels = "^cortex", method = "chaikin") |>
  atlas_simplify(keep = 0.3, exclude = "^cortex") |>
  atlas_smooth(smoothness = 0.4, exclude = "^cortex")

usethis::use_data(
  .miccai_cortical,
  .miccai_subcortical,
  overwrite = TRUE,
  compress = "xz",
  internal = TRUE
)
