import 'dart:math';

class HashTable {
  int tableSize;
  List<List<String>> table;

  HashTable(this.tableSize) : table = List.generate(tableSize, (_) => <String>[]);

  int hashFunction(String key) {
    var hashValue = 0;
    for (int i = 0; i < key.length; i++) {
      hashValue = (hashValue + key.codeUnitAt(i)) * 31;
    }
    return (hashValue % tableSize).abs();
  }

  void add(String key) {
    var index = hashFunction(key);
    if (!table[index].contains(key)) {
      table[index].add(key);
    }
  }

  void remove(String key) {
    var index = hashFunction(key);
    var list = table[index];
    var lastIndex = -1;
    for (int i = list.length - 1; i >= 0; i--) {
      if (list[i] == key) {
        lastIndex = i;
        break;
      }
    }
    if (lastIndex != -1) {
      list.removeAt(lastIndex);
      print("Removed Successfully: $key");
    } else {
      print("Key was not found: $key");
    }
  }

  bool contains(String key) {
    var index = hashFunction(key);
    if (table[index].contains(key)) {
      print("$key found");
      return true;
    } else {
      print("$key not found");
      return false;
    }
  }

  String display() {
    StringBuffer sb = StringBuffer();
    for (int i = 0; i < table.length; i++) {
      if(table[i].isNotEmpty){
      sb.write('$i: ${table[i]}\n');
      }
    }
    return sb.toString();
  }
}

// void main() {
//   var hashTable = HashTable(10);
//   hashTable.add("example");
//   hashTable.add("test");
//   hashTable.add("dart");

//   print(hashTable.display());

//   hashTable.contains("test");
//   hashTable.contains("flutter");

//   hashTable.remove("test");
//   hashTable.remove("flutter");

//   print(hashTable.display());
// }
