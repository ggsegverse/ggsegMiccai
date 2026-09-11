describe("miccai_cortical", {
  it("is a valid cortical ggseg_atlas", {
    expect_s3_class(miccai_cortical(), "ggseg_atlas")
    expect_s3_class(miccai_cortical(), "cortical_atlas")
    expect_true(ggseg.formats::is_ggseg_atlas(miccai_cortical()))
  })

  it("renders with ggseg", {
    skip_if_not_installed("ggseg")
    skip_if_not_installed("vdiffr")
    vdiffr::expect_doppelganger(
      "miccai-cortical-2d",
      ggseg::brain_test_plot(miccai_cortical())
    )
  })

  it("renders with ggseg3d", {
    skip_if_not_installed("ggseg3d")
    skip_if_not_installed("ggseg.meshes")
    p <- ggseg3d::ggseg3d(atlas = miccai_cortical())
    expect_s3_class(p, c("plotly", "htmlwidget"))
  })
})

describe("miccai_subcortical", {
  it("is a valid ggseg_atlas", {
    expect_s3_class(miccai_subcortical(), "ggseg_atlas")
    expect_true(
      ggseg.formats::is_ggseg_atlas(miccai_subcortical())
    )
  })

  it("renders with ggseg", {
    skip_if_not_installed("ggseg")
    skip_if_not_installed("vdiffr")
    vdiffr::expect_doppelganger(
      "miccai-subcortical-2d",
      ggseg::brain_test_plot(miccai_subcortical())
    )
  })
})
