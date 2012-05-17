require 'rake/clean'

# Configuration
# -------------
SOURCE = FileList['basics/basics.md', 'turtle/turtle.md']
SOURCE_DIRS = FileList['basics', 'turtle']
BUILD_DIR = 'slides'
TARGET = "#{BUILD_DIR}/slides.html"
STYLE = 'style.html'
MEDIA = FileList["basics/*.{jpg,png}"]
CLEAN.include(BUILD_DIR)
# --------------

directory BUILD_DIR

task :default => :build

desc "Build the presentation"
task :build => [TARGET, :tidy]

# Compile the slide
file TARGET => [BUILD_DIR, STYLE, *SOURCE] do
  sh "pandoc -t dzslides #{SOURCE.map { |f| "-s #{f}" }.join(" ") } -o #{TARGET} --highlight-style=pygments --include-after-body=#{STYLE}"
end

# Copy media files into the build directory
MEDIA.each do |source|
  target = "#{BUILD_DIR}/#{source.pathmap("%f")}"
  file target => source do
    cp source, target
  end
  task :build => target
end

# Remove extraneous empty <h1></h1> on figure slides
task :tidy => TARGET do
  rough = File.read(TARGET)
  File.open TARGET, 'w' do |f|
    f.write(rough.gsub(/^\s*<h1><\/h1>$/, ''))
  end
end
