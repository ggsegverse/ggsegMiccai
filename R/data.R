#' Neuromorphometrics Cortical Atlas
#'
#' Cortical regions from the Neuromorphometrics maximum probability tissue
#' labels distributed with SPM12, derived from the MICCAI 2012 Grand Challenge
#' and Workshop on Multi-Atlas Labeling. Projected onto the fsaverage5
#' surface.
#'
#' The label data are released under CC BY-NC. Credit the MRI scans as
#' originating from the OASIS project and the labeled data as "provided by
#' Neuromorphometrics, Inc. under academic subscription".
#'
#' @family ggseg_atlases
#' @family cortical_atlases
#'
#' @references Landman BA, Warfield SK (Eds.) (2012). *MICCAI 2012 Workshop on
#'   Multi-Atlas Labeling*.
#'
#'   Marcus DS, et al. (2007). Open Access Series of Imaging Studies (OASIS):
#'   cross-sectional MRI data in young, middle aged, nondemented, and demented
#'   older adults. *Journal of Cognitive Neuroscience*, 19(9):1498-1507.
#'   \doi{10.1162/jocn.2007.19.9.1498}
#' @return A [ggseg.formats::ggseg_atlas] object (cortical).
#' @export
#' @examples
#' neuromorphometrics_cortical()
# nolint next: object_usage_linter.
neuromorphometrics_cortical <- function() .neuromorphometrics_cortical

#' Neuromorphometrics Subcortical Atlas
#'
#' Subcortical regions from the Neuromorphometrics maximum probability tissue
#' labels distributed with SPM12, derived from the MICCAI 2012 Grand Challenge
#' and Workshop on Multi-Atlas Labeling. Ventricles, white matter, CSF and
#' vessels are not included.
#'
#' The label data are released under CC BY-NC. Credit the MRI scans as
#' originating from the OASIS project and the labeled data as "provided by
#' Neuromorphometrics, Inc. under academic subscription".
#'
#' @family ggseg_atlases
#' @family subcortical_atlases
#'
#' @inherit neuromorphometrics_cortical references
#' @return A [ggseg.formats::ggseg_atlas] object (subcortical).
#' @export
#' @examples
#' neuromorphometrics_subcortical()
# nolint next: object_usage_linter.
neuromorphometrics_subcortical <- function() .neuromorphometrics_subcortical
