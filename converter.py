# The MIT License (MIT)
# Copyright © 2023 Raffaele Intorcia
#
# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files (the “Software”),
# to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following conditions:
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS
# OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

import glob, os
import shutil
import sys
import re

def replaceUntilNecessary(stringToElaborate):
  newStringToElaborate = re.sub(r"(\{[^\{\}]*\})", r";", stringToElaborate)
  while newStringToElaborate != stringToElaborate:
    stringToElaborate = newStringToElaborate
    newStringToElaborate = re.sub(r"(\{[^\{\}]*\})", r";", stringToElaborate)

  return stringToElaborate

def convertFile(filename):
  print("Processing " + filename)
  head, tail = os.path.split(filename)

  outputFileName = head + '/output/' + tail

  print("Reading...")
  content = open(filename, 'r').read()

  print("Editing...")

  # match .assert "macroName(x)", { macroName(1) }, { lda #1 }
  content = re.sub(".assert [\.\|\"\w\(\)\,\s+\{\}\%\#\$\;\[\]]+\}", "", content)

  # match .assert "macroName(x)", macroName(1), 1
  content = re.sub(r"(.assert [^\,]+\,[^\,]+\,[^\n]+)", r"", content)

  # remove filenamespace
  content = re.sub(".filenamespace [\w]*\n", "", content)
  # remove importonce
  content = re.sub("#importonce[\w]*\n", "", content)
  # remove import
  content = re.sub("#import[\w\"\\\/\.\s]*\n", "", content)

  # we need to clean macro/function body, but first check if there
  # is a namespace (we don't have to clean namespace body)
  namespaceIndex = content.find(".namespace ");
  if (namespaceIndex != -1):
    # there is a namespace, preserve it and clean any body inside it
    namespaceIndex = content.find("{", namespaceIndex) + 1
    contentInNamespace = content[namespaceIndex:]

    contentInNamespaceReplaced = replaceUntilNecessary(contentInNamespace)

    content = content.replace(contentInNamespace, contentInNamespaceReplaced)
  else:
    #there is no namespace, clean all bodies
    content = replaceUntilNecessary(content)

  # convert keywords to be interpreted by doxygen
  content = content.replace('.namespace ', 'namespace ')
  content = content.replace('.macro ', 'macro ')
  content = content.replace('.function ', 'function ')
  content = content.replace('.label ', 'label ')
  content = content.replace('.pseudocommand ', 'pseudocommand ')

  # add semicolor at the end of label declaration
  content = re.sub(r'(label[^\n]+)', r'\1;', content)

  # finish... save the new file
  print("Saving " + outputFileName + "...")
  f = open(outputFileName, 'w')
  f.write(content)
  f.close()

print("Using " + sys.argv[1] + " command line arguments")
head, tail = os.path.split(sys.argv[1])
print("Creating " + head + '/output/')
os.makedirs(head + '/output/', exist_ok=True)
print(sys.argv)

for file in sys.argv[1:]:
  convertFile(file)
