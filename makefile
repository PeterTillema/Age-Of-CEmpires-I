# Commands and tools
ASSEMBLER := spasm
CONVHEX   := convhex
CONVPNG   := convpng
CREATEDIR := mkdir

# Flags
ASFLAGS   := -E -T -L -I gfx/bin
CONVFLAGS := -x

# Sources
SRC       := aoce.asm
BINTARGET := AOCE.bin
GFXTARGET := AGE1.inc
RELOCASM  := relocation_table*.asm

# Directories
OUTPUTDIR := bin
GFXDIR    := gfx

# Windows and Linux differences
ifeq ($(OS),Windows_NT)
SHELL = cmd.exe
COPY  = xcopy /s /y /q
RM    = del /q /f
GFXOUTDIR := $(GFXDIR)\bin
APPVARS   := $(GFXOUTDIR)\\*.8xv
TARGET    := $(OUTPUTDIR)\$(BINTARGET)
else
COPY = cp
RM   = rm -f
GFXOUTDIR := $(GFXDIR)/bin
APPVARS   := $(GFXOUTDIR)/*.8xv
TARGET    := $(OUTPUTDIR)/$(BINTARGET)
endif

# Check dependecies
all: ${OUTPUTDIR} $(OUTPUTDIR)/$(BINTARGET)

# Build the source
$(OUTPUTDIR)/$(BINTARGET):$(SRC)
	@$(ASSEMBLER) $(ASFLAGS) $< $@
	@$(CONVHEX) $(CONVFLAGS) $(TARGET)
	@$(RM) $(RELOCASM) $(TARGET)
	@$(COPY) $(APPVARS) $(OUTPUTDIR)

# ConvPNG the graphics
convpng: ${GFXOUTDIR}
	@cd $(GFXDIR) && $(CONVPNG)

# Create the bin/ folder
${OUTPUTDIR}:
	@mkdir $(OUTPUTDIR)

# Create the gfx/bin/ folder
${GFXOUTDIR}:
	@mkdir $(GFXOUTDIR)

.PHONY: all convpng