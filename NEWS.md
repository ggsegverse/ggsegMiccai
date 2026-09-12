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
