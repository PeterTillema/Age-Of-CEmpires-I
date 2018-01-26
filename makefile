ifeq ($(OS),Windows_NT)
SHELL = cmd.exe
COPY = xcopy /s /y /q
RM = del /q /f
else
COPY = cp
RM = rm -f
endif

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
GFXOUTDIR := $(GFXDIR)\bin
RELOCASM  := relocation_table*.asm

all: ${OUTPUTDIR} $(OUTPUTDIR)/$(BINTARGET)

$(OUTPUTDIR)/$(BINTARGET):$(SRC)
	@$(ASSEMBLER) $(ASFLAGS) $< $@
	@$(CONVHEX) $(CONVFLAGS) $(OUTPUTDIR)/$(BINTARGET)
	@$(RM) $(RELOCASM) $(OUTPUTDIR)\$(BINTARGET)
	@$(COPY) $(GFXOUTDIR)\\*.8xv $(OUTPUTDIR)

convpng: ${GFXOUTDIR}
	@cd $(GFXDIR) && $(CONVPNG)

${OUTPUTDIR}:
	@mkdir $(OUTPUTDIR)

${GFXOUTDIR}:
	@mkdir $(GFXOUTDIR)

.PHONY: all