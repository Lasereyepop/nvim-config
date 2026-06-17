return {
    "sphamba/smear-cursor.nvim",
    event = "VeryLazy",
    opts = {
        -- Match the gruvbox-material orange cursor
        cursor_color = "#e78a4e",
        normal_bg = "#1d2021",

        stiffness = 0.8,      -- Responsiveness (0 = very floaty, 1 = instant)
        trailing_stiffness = 0.5, -- How quickly the tail catches up
        distance_stop_animating = 0.5,
        hide_target_hack = false,
    },
}
