class LinkedList
	attr_accessor :head, :tail
	def initialize
		@head = nil
		@tail = nil
	end

	def append(value)
		node = Node.new(value)
		if @head.nil?
			@head = node
			@tail = node
		else
			@tail.next_node = node
			@tail = node
		end
	end

	def prepend(value)
		node = Node.new(value)
		if @head.nil?
			@head = node
			@tail = node
		else
			node.next_node = @head
			@head = node
		end
	end

	def size
		if @head == nil
			0
		else
			counter = 1
			reference = @head.next_node
			until reference.nil?
				reference = reference.next_node
				counter +=1
			end
			counter
		end
	end

	def at(index)
		if (@head.nil? || index>=self.size)
			nil
		else
			position = 0 
			current = @head 
			until position==index 
				current = current.next_node
				position+=1
			end
			current
		end
	end

	def pop
		@tail = self.at((self.size)-2)
		@tail.next_node = nil
	end

	def contains?(value)
		current = @head
		contain = false
		until current==nil
			if current.value==value
				contain = true
			end
			current = current.next_node
		end
		contain
	end

	def find(data)
		current = @head
		found = false
		index = 0
		until current==nil || found==true
			if current.value==data
				found = true
				return index
			else
				current = current.next_node
				index+=1
			end
		end
		return nil if found==false
	end

	def to_s
		if @head!=nil
			print "#{@head.value} -> "
			reference = @head.next_node
			until reference.nil? 
				print "#{reference.value} -> "
				reference = reference.next_node
			end

			if reference.nil?
				print "nil"
			end

		else
			print "empty"
		end
	end

	def insert_at(value, index)
		if (index<0 || index>self.size)
			return nil
		elsif index==0
			self.prepend(value)
		elsif index == self.size
			self.append(value)
		else
			node=Node.new(value)
			node.next_node=self.at(index)
			self.at(index-1).next_node=node
		end
		self
	end

	def remove_at(index)
		if (index<0 || index>=self.size)
			return nil
		elsif index==0
			@head = self.at(1)
		elsif index == self.size-1
			self.pop
		else
			self.at(index-1).next_node=self.at(index+1)
		end
		self
	end
end

class Node
	attr_accessor :value, :next_node
	def initialize(value)
		@value = value
		@next_node = nil
	end
end

list = LinkedList.new

list.append(2)
list.prepend(5)
list.append(10)
list.append(7)
list.append(4)

puts list.to_s
list.remove_at(5).to_s





