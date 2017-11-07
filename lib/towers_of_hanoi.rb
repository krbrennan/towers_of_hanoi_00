#!/usr/bin/env ruby

class TowersOfHanoi
  attr_reader :towers

  def initialize
    @towers = [[3,2,1],[],[]]
  end

  def play
      until won?
        loop do
          render
          puts "Where would you like to move a ring from?"
          from = gets.chomp.to_i
          puts "where would you like to move a ring to?"
          to = gets.chomp.to_i
          move(from, to)

          if won?
            reset
          end
        end
    end

  end

  def reset
    @towers = [[3,2,1],[],[]]
    'clear'
    puts "WOO, YOU DID IT NOW DO IT AGAIN"
    play
  end

  def render
    puts "Tower 0---->" + @towers[0].join(" ")
    puts "Tower 1---->" + @towers[1].join(" ")
    puts "Tower 2---->" + @towers[2].join(" ")
  end

  def move(from, to)
    if valid_move?(from, to)
      @towers[to] << @towers[from].pop
    else
      puts "please select again"
    end
  end

  def valid_move?(from_tower, to_tower)
    if from_tower < 0 || from_tower > 2
      puts "PLEASE SELECT ANOTHER FROM_TOWER"
    elsif to_tower < 0 || from_tower > 2
      puts "PLEASE SELECT ANOTHER TO_TOWER"
    elsif @towers[from_tower].empty?
      puts "PLEASE CHOOSE AGAIN"
      false
    elsif @towers[to_tower].empty?
      return true
    elsif @towers[from_tower].last > @towers[to_tower].last
      return false
    else
      true
    end
  end

  def won?
    if @towers[0].empty?
      if @towers[1].empty?
        return true
      elsif @towers[2].empty?
        return true
      else
        false
      end
      false
    end

  end
end
new = TowersOfHanoi.new
new.play
