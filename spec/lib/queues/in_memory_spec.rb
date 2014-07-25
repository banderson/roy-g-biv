require 'rails_helper'

class TestObject; end

module Queues
  describe InMemory do
    let(:queue) { InMemory }

    it 'should be a thing' do
      expect(InMemory.class).to eq Class
    end

    describe '#enqueue' do
      it 'should add an item to the queue' do
        input = TestObject.new
        expect(queue.length).to eq 0
        queue.enqueue input
        expect(queue.length).to eq 1
        output = queue.dequeue
        expect(queue.length).to eq 0
        expect(output).to eq input
      end
    end

    describe '#dequeue' do
      it 'should remove and return items from the queue in order' do
        input1 = TestObject.new
        input2 = TestObject.new
        expect(queue.length).to eq 0
        queue.enqueue input1
        expect(queue.length).to eq 1
        queue.enqueue input2
        expect(queue.length).to eq 2
        output = queue.dequeue
        expect(queue.length).to eq 1
        expect(output).to eq input1
        output = queue.dequeue
        expect(queue.length).to eq 0
        expect(output).to eq input2
      end

      it 'should return nil if there are no items in the queue' do
        expect(queue.dequeue).to be_nil
      end

      it 'should keep the length the same if the queue is empty' do
        expect(queue.length).to eq 0 #sanity check
        queue.dequeue
        expect(queue.length).to eq 0
      end
    end

    describe '#empty' do
      it 'should clear out all items from the queue' do
        9.times { queue.enqueue TestObject.new }
        expect(queue.length).to eq 9
        queue.empty
        expect(queue.length).to eq 0
      end
    end
  end
end
