return {
  "mrjones2014/smart-splits.nvim",

  keys = {
    { "<a-h>", function() require('smart-splits').resize_left() end, desc = "Resize left" },
    { "<a-j>", function() require('smart-splits').resize_down() end, desc = "Resize down" },
    { "<a-k>", function() require('smart-splits').resize_up() end, desc = "Resize up" },
    { "<a-l>", function() require('smart-splits').resize_right() end, desc = "Resize right" },
  },
}
