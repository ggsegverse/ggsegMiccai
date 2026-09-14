# ggsegMiccai 1.0.0.9001

- The atlases are rebuilt with ggseg.extra 1.9.9.9029 and ggseg.formats
  0.0.4.9005, for the subcortical slab fix. The default slabs are now framed
  on the bounding box of the labels rather than of the whole volume, so every
  panel carries structures. The previous build had an entirely empty
  `axial_4` panel, and 9 of the 24 structures - both amygdalae, both
  pallida, both accumbens areas, both basal forebrains and cerebellar vermal
  lobules VI-VII - were absent from every coronal view. Both counts are now
  zero, and the atlas has seven populated views instead of eight with one
  empty.
- No regions were added or removed: the cortical atlas still has 101 regions
  and the subcortical atlas 24.
- `data-raw/make_atlas.R` keeps `atlas_simplify(keep = 0.2)` and still does
  not smooth. Smoothing no longer inflates the vertex count the way it used
  to, but on this atlas it still takes the cortical geometry from 7849 to
  11009 polygon coordinates, over the 10000 threshold that ggseg.formats
  warns at, and the simplified contours are already smooth.

# ggsegMiccai 1.0.0.9000

- The atlases are rebuilt with ggseg.extra 1.9.9.9023, which fixes two
  defects visible in the data. The cortical atlas no longer has unlabelled
  holes: 1026 left and 1075 right vertices had no region, and the medial wall
  is now grey context instead of parcels bleeding across it. The subcortical
  atlas is no longer upside down in its 2D views, where the cerebellum sat
  above the basal ganglia and the brain stem pointed up.
- `rh_Left_MCgG_middle_cingulate_gyrus` is gone: a left-hemisphere label that
  had bled onto the right surface, leaving 101 regions. No region names were
  lost.

# ggsegMiccai 1.0.0

- Initial release with `miccai` atlases as a unified `ggseg_atlas` object
  for the ggseg 2.0 ecosystem.
