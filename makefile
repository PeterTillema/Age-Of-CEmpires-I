ASFLAGS   := -E -T -L -I gfx/bin
CONVFLAGS := -x
ASSEMBLER := spasm
CONVHEX   := convhex
CONVPNG   := convpng
CREATEDIR := mkdir
SRC       := aoce.asm
BINTARGET := AOCE.bin
GFXTARGET := AGE1.inc
PNGINI    := convpng.ini
OUTPUTDIR := bin
GFXDIR    := gfx
RELOCASM  := relocation_table*.asm

ifeq ($(OS),Windows_NT)
SHELL = cmd.exe
COPY = xcopy /s /y /q
RM = del /q /f
GFXOUTDIR := $(GFXDIR)\bin
APPVARS   := $(GFXOUTDIR)\\*.8xv
TARGET := $(OUTPUTDIR)\$(BINTARGET)
else
COPY = cp
RM = rm -f
GFXOUTDIR := $(GFXDIR)/bin
APPVARS   := $(GFXOUTDIR)/*.8xv
TARGET    := $(OUTPUTDIR)/$(BINTARGET)
endif

all: ${OUTPUTDIR} $(OUTPUTDIR)/$(BINTARGET)

$(OUTPUTDIR)/$(BINTARGET):$(SRC)
	@$(ASSEMBLER) $(ASFLAGS) $< $@
	@$(CONVHEX) $(CONVFLAGS) $(TARGET)
	@$(RM) $(RELOCASM) $(TARGET)
	@$(COPY) $(APPVARS) $(OUTPUTDIR)

convpng: ${GFXOUTDIR}
	@cd $(GFXDIR) && $(CONVPNG)

${OUTPUTDIR}:
	@mkdir $(OUTPUTDIR)

${GFXOUTDIR}:
	@mkdir $(GFXOUTDIR)

.PHONY: all convpng