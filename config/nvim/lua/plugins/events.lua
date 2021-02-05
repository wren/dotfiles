
nvim_create_augroups({
  -- Disable swap/undo/viminfo/shada files in temp directories or shm
  packer_compile_auto = {
    'BufWritePost plugins/install.lua PackerCompile'
  },
})
