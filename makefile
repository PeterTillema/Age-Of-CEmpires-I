# Commands and tools
ASSEMBLER ?= spasm
CONVHEX   ?= convhex
CONVPNG   ?= convpng
 
# Flags
ASFLAGS   ?= -E -T -L -I gfx/bin
CONVFLAGS ?= -x
 
# Sources
SRC       ?= aoce.asm
TARGETBIN ?= AOCE.bin
TARGET8XP ?= AOCE.8xp
TARGETGFX ?= AGE1.inc
 
# Directories
BINDIR    ?= bin
GFXDIR    ?= gfx
ROTDIR    ?= routines
DATDIR    ?= data
INCDIR    ?= includes
 
# Windows and Linux differences
ifeq ($(OS),Windows_NT)
SHELL      = cmd.exe
NATIVEPATH = $(subst /,\,$(1))
COPY       = xcopy /s /y /q
RM         = del /q /f
MKDIR      = mkdir
CD         = cd
WINCHKDIR  = if not exist
WINCHKPATH = $(NATIVEPATH)
else
NATIVEPATH = $(subst \,/,$(1))
COPY       = cp -r
RM         = rm -f
MKDIR      = mkdir -p
CD         = cd
endif
 
APPVARS   := $(call NATIVEPATH,$(GFXDIR)/$(BINDIR)/*.8xv)
RELOCASM  := relocation_table*.asm
ROTSRCS   := $(call NATIVEPATH,$(wildcard $(ROTDIR)/*.asm))
DATSRCS   := $(call NATIVEPATH,$(wildcard $(DATDIR)/*.asm))
INCSRCS   := $(call NATIVEPATH,$(wildcard $(INCDIR)/*.asm))
 
# Check dependecies
all: $(BINDIR) $(BINDIR)/$(TARGET8XP)
 
$(BINDIR)/$(TARGET8XP): $(BINDIR)/$(TARGETBIN)
	@$(CONVHEX) $(CONVFLAGS) $(call NATIVEPATH,$<) && \
	$(RM) $(RELOCASM)
 
# Build the source
$(BINDIR)/$(TARGETBIN): $(SRC) $(ROTSRCS) $(DATSRCS) $(INCSRCS)
	@$(ASSEMBLER) $(ASFLAGS) $(call NATIVEPATH,$<) $(call NATIVEPATH,$@)
 
# ConvPNG the graphics
gfx: $(GFXDIR)/$(BINDIR)
	@$(CD) $(GFXDIR) && $(CONVPNG) && $(CD) .. && \
	$(COPY) $(APPVARS) $(call NATIVEPATH,$(BINDIR)/)
 
# Create the bin/ folder
$(BINDIR):
	@$(WINCHKDIR) $(call WINCHKPATH,$@) $(MKDIR) $(call NATIVEPATH,$@)
 
# Create the gfx/bin folder
$(GFXDIR)/$(BINDIR):
	@$(WINCHKDIR) $(call WINCHKPATH,$@) $(MKDIR) $(call NATIVEPATH,$@)
 
clean:
	@$(RM) $(call NATIVEPATH,$(addprefix $(BINDIR)/,$(TARGET8XP) $(TARGETBIN) *.8xv *.lst *.lab))
 
.PHONY: all gfx clean