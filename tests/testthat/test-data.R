describe("neuromorphometrics_cortical", {
  it("is a valid cortical ggseg_atlas", {
    expect_s3_class(neuromorphometrics_cortical(), "ggseg_atlas")
    expect_s3_class(neuromorphometrics_cortical(), "cortical_atlas")
    expect_true(ggseg.formats::is_ggseg_atlas(neuromorphometrics_cortical()))
  })

  it("renders with ggseg", {
    skip_if_not_installed("ggseg")
    skip_if_not_installed("vdiffr")
    vdiffr::expect_doppelganger(
      "neuromorphometrics-cortical-2d",
      ggseg::brain_test_plot(neuromorphometrics_cortical())
    )
  })

  it("renders with ggseg3d", {
    skip_if_not_installed("ggseg3d")
    skip_if_not_installed("ggseg.meshes")
    p <- ggseg3d::ggseg3d(atlas = neuromorphometrics_cortical())
    expect_s3_class(p, c("plotly", "htmlwidget"))
  })
})

describe("neuromorphometrics_subcortical", {
  it("is a valid ggseg_atlas", {
    expect_s3_class(neuromorphometrics_subcortical(), "ggseg_atlas")
    expect_true(
      ggseg.formats::is_ggseg_atlas(neuromorphometrics_subcortical())
    )
  })

  it("renders with ggseg", {
    skip_if_not_installed("ggseg")
    skip_if_not_installed("vdiffr")
    vdiffr::expect_doppelganger(
      "neuromorphometrics-subcortical-2d",
      ggseg::brain_test_plot(neuromorphometrics_subcortical())
    )
  })
})
