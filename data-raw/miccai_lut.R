non_grey_labels <- c(
  "3rd Ventricle",
  "4th Ventricle",
  "Right Cerebellum White Matter",
  "Left Cerebellum White Matter",
  "Right Cerebral White Matter",
  "Left Cerebral White Matter",
  "CSF",
  "Right Inf Lat Vent",
  "Left Inf Lat Vent",
  "Right Lateral Ventricle",
  "Left Lateral Ventricle",
  "Right vessel",
  "Left vessel",
  "Optic Chiasm"
)

read_miccai_labels <- function(xml_file) {
  xml <- readLines(xml_file, warn = FALSE, encoding = "latin1")
  matches <- regmatches(
    xml,
    regexec("<index>([0-9]+)</index><name>([^<]+)</name>", xml)
  )
  matches <- Filter(function(match) length(match) == 3, matches)

  data.frame(
    idx = as.integer(vapply(matches, `[`, character(1), 2)),
    label = vapply(matches, `[`, character(1), 3)
  )
}

miccai_lut <- function(xml_file) {
  labels <- read_miccai_labels(xml_file)
  labels <- labels[!labels$label %in% non_grey_labels, ]

  region <- sub("^(Left|Right) ", "", labels$label)
  type <- ifelse(labels$idx >= 100L, "cortical", "subcortical")
  colours <- character(nrow(labels))
  for (atlas_type in unique(type)) {
    in_type <- type == atlas_type
    type_regions <- unique(region[in_type])
    palette <- grDevices::hcl.colors(length(type_regions), "Dynamic")
    colours[in_type] <- palette[match(region[in_type], type_regions)]
  }
  rgb <- grDevices::col2rgb(colours)

  data.frame(
    idx = labels$idx,
    label = labels$label,
    R = rgb["red", ],
    G = rgb["green", ],
    B = rgb["blue", ],
    A = 0L,
    type = type
  )
}
