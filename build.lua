#!/usr/bin/env texlua
-- Build script for "biguint" files

-- Identify the bundle and module: the module may be empty in the case where
-- there is no subdivision
bundle = ""
module = "biguint"

-- Location of main directory: use Unix-style path separators
maindir = "."

os.setenv("guess_input_kanji_encoding", "0")

installfiles = {
  "biguint.sty",
  "biguint-generic.tex",
  "biguint-code.tex",
}
sourcefiles = {
  "*.dtx",
  "*.ins",
}

tagfiles = {"*.dtx","*.ins","LICENSE"}
textfiles = {"*.md", "LICENSE"}

checkconfigs = {"build","config-plain"}

-- Check settings
checkengines = {"pdftex","ptex","uptex","luatex","xetex"}
stdengine    = "pdftex"
checkformat  = "latex"
-- checkopts    = "-interaction=nonstopmode"

-- Typedet engine settings
-- typesetexe = "pdflatex"
-- typesetopts = "-interaction=nonstopmode"

-- pdftex also log non-ASCII.
asciiengines = {}

-- Should not wrap log lines.
maxprintline = 9999

-- Detail how to set the version automatically
function update_tag(file,content,tagname,tagdate)
  local iso = "%d%d%d%d%-%d%d%-%d%d"
  local author = "Yukimasa Morimi (h20y6m)"
  if string.match(content,"Copyright %(c%)%s*[%d%-,]+ " .. author) then
    local year = os.date("%Y")
    content = string.gsub(content,
      "Copyright %(c%)%s*([%d%-,]+) " .. author,
      "Copyright (c) %1," .. year .. " " .. author)
    content = string.gsub(content,year .. "," .. year,year)
    content = string.gsub(content,
      "%-" .. math.tointeger(year - 1) .. "," .. year,
      "-" .. year)
    content = string.gsub(content,
      math.tointeger(year - 2) .. "," .. math.tointeger(year - 1) .. "," .. year,
      math.tointeger(year - 2) .. "-" .. year)
  end
  if string.match(file,"%.dtx$") then
    content = string.gsub(content,
      "\n\\ProvidesExpl" .. "(%w+ *{[^}]+} *){" .. iso .. "}",
      "\n\\ProvidesExpl%1{" .. tagname .. "}")
    return string.gsub(content,
      "\n%% \\date{Released " .. iso .. "}\n",
      "\n%% \\date{Released " .. tagname .. "}\n")
  end
  return content
end

-- 
kpse.set_program_name("kpsewhich")

-- For old l3build
if not release_date then
  dofile(kpse.lookup("l3build.lua"))
end
