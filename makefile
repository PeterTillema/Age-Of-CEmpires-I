ifeq ($(OS),Windows_NT)
SHELL = cmd.exe
NATIVEPATH = $(subst /,\,$(1))
COPY = xcopy /s /y /q
RM = del /f 2>nul
else
COPY = cp
RM = rm -f
endif

ASFLAGS   := -E -T -L -I $(call NATIVEPATH, gfx\bin)
CONVFLAGS := -x
ASSEMBLER := spasm
CONVHEX   := convhex
CONVPNG   := convpng
CREATEDIR := mkdir
SRC       := aoce.asm
BINTARGET := AOCE.bin
GFXTARGET := AGE1.inc
PNGINI    := convpng.ini
OUTPUTDIR := $(call NATIVEPATH, bin)
GFXDIR    := $(call NATIVEPATH, gfx)
GFXOUTDIR := $(call NATIVEPATH, $(GFXDIR)\bin)
RELOCASM  := $(call NATIVEPATH, relocation_table*.asm)

all: ${OUTPUTDIR} $(OUTPUTDIR)/$(BINTARGET)
 
$(OUTPUTDIR)/$(BINTARGET): $(SRC)
	@$(ASSEMBLER) $(ASFLAGS) $< $(call NATIVEPATH, $@)
	@$(CONVHEX) $(CONVFLAGS) $(call NATIVEPATH, $(OUTPUTDIR)/$(BINTARGET))
	@$(RM) $(RELOCASM) $(call NATIVEPATH, $(OUTPUTDIR)/$(BINTARGET))
	@$(COPY) $(GFXOUTDIR)\\*.8xv $(OUTPUTDIR)

convpng: ${GFXOUTDIR}
	@cd $(GFXDIR) && $(CONVPNG)
	
${OUTPUTDIR}:
	@mkdir $(OUTPUTDIR)
	
${GFXOUTDIR}:
	@mkdir $(GFXOUTDIR)
	
.PHONY: all