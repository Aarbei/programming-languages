# Програма, що створює бінарне дерево, додає до нього вузли
# видаляє вузли, виконує пошук по дереву, виконує обхід дерева трьома
# способами та виводить результат на екран
class Node
    attr_accessor :value, :left, :right
  
    def initialize(value)
      @value = value
      @left = nil
      @right = nil
    end
  end
  
  class Tree
    attr_accessor :root
  
    def initialize
      @root = nil
    end
  
    def add(*values)
      values.each { |value| @root = add_node(@root, value) }
    end
  
    def inorder_walk(node = @root, &block)
      return if node.nil?
  
      inorder_walk(node.left, &block)
      yield node.value if block_given?
      inorder_walk(node.right, &block)
    end
  
    def preorder_walk(node = @root, &block)
      return if node.nil?
  
      yield node.value if block_given?
      preorder_walk(node.left, &block)
      preorder_walk(node.right, &block)
    end
  
    def postorder_walk(node = @root, &block)
      return if node.nil?
  
      postorder_walk(node.left, &block)
      postorder_walk(node.right, &block)
      yield node.value if block_given?
    end
  
    def search(value)
      search_node(@root, value)
    end
  
    def delete(value)
      @root = delete_node(@root, value)
    end
  
    def print_tree(node = @root, prefix = '', is_left = true)
      return if node.nil?
  
      print_tree(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false)
      puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
      print_tree(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true)
    end
  
    private
  
    def add_node(node, value)
      return Node.new(value) if node.nil?
  
      value < node.value ? node.left = add_node(node.left, value) : node.right = add_node(node.right, value)
  
      node
    end
  
    def search_node(node, value)
      return nil if node.nil?
  
      value == node.value ? node : (value < node.value ? search_node(node.left, value) : search_node(node.right, value))
    end
  
    def delete_node(node, value)
      return nil if node.nil?
  
      if value < node.value
        node.left = delete_node(node.left, value)
      elsif value > node.value
        node.right = delete_node(node.right, value)
      else
        if node.left.nil?
          return node.right
        elsif node.right.nil?
          return node.left
        end
  
        node.value = find_min_value(node.right)
        node.right = delete_node(node.right, node.value)
      end
  
      node
    end
  
    def find_min_value(node)
      while node.left
        node = node.left
      end
      node.value
    end
  end
  
  tree = Tree.new
  tree.add(2, 1, 8, 3, 5, 7, 4, 6)
  
  puts "Бінарне дерево:"
  tree.print_tree
  
  puts "\n Видалення вузла зі значенням 3."
  tree.delete(3)
  
  puts "\n Бінарне дерево після видалення вузла:"
  tree.print_tree

  puts "\n Проходження дерева в порядку зростання:"
  tree.inorder_walk{ |value| print value, ' '}
  
  puts "\n Проходження дерева в порядку(лівий, правий, теперішній):"
  tree.postorder_walk{ |value| print value, ' '}

  puts "\n Проходження дерева в порядку(теперішній, лівий, правий):"
  tree.preorder_walk{ |value| print value, ' '}