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
TARGET := $(OUTPUTDIR)\$(BINTARGET)
else
COPY = cp
RM = rm -f
GFXOUTDIR := $(GFXDIR)/bin
TARGET := $(OUTPUTDIR)/$(BINTARGET)
endif

all: ${OUTPUTDIR} $(OUTPUTDIR)/$(BINTARGET)

$(OUTPUTDIR)/$(BINTARGET):$(SRC)
	@$(ASSEMBLER) $(ASFLAGS) $< $@
	@$(CONVHEX) $(CONVFLAGS) $(TARGET)
	@$(RM) $(RELOCASM) $(TARGET)
	@$(COPY) $(GFXOUTDIR)\\*.8xv $(OUTPUTDIR)

convpng: ${GFXOUTDIR}
	@cd $(GFXDIR) && $(CONVPNG)

${OUTPUTDIR}:
	@mkdir $(OUTPUTDIR)

${GFXOUTDIR}:
	@mkdir $(GFXOUTDIR)

.PHONY: all