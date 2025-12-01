# FSL setup (lazy-load for performance)
export FSLDIR=/usr/local/fsl
if [ -d "$FSLDIR" ]; then
  export PATH="${FSLDIR}/bin:${PATH}"
  
  # Lazy-load FSL configuration only when FSL commands are used
  fsl_init() {
    if [ -f "${FSLDIR}/etc/fslconf/fsl.sh" ]; then
      . "${FSLDIR}/etc/fslconf/fsl.sh"
    fi
  }
  # Create aliases for common FSL commands that trigger lazy loading
  for cmd in fsl fslview bet flirt; do
    alias $cmd="fsl_init && unalias $cmd 2>/dev/null && $cmd"
  done
fi
