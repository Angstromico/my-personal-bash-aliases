runjava() {
  # Default class name is Main
  local classname=${1:-Main}

  # Compile the Java file
  javac "./src/${classname}.java" || return

  # Run the compiled class
  java -cp src "$classname"
}