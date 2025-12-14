runjava() {
  # Default class name is Main
  local classname=${1:-Main}

  # Compile the Java file
  javac "./src/${classname}.java" || return

  # Run the compiled class
  java -cp src "$classname"
}

makejava() {
  # Default class name is Main
  local classname=${1:-Main}
  local filepath="./src/${classname}.java"

  cat > "$filepath" <<EOF
public class ${classname} {
    public static void main(String[] args) {
        System.out.printf("Hello and welcome!\\n");

        for (int i = 1; i <= 5; i++) {
            System.out.println("i = " + i);
        }
    }
}
EOF

  echo "Created $filepath"
}
