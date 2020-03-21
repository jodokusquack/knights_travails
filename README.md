# Knight's Travails

This project from [The Odin Project](https://www.theodinproject.com/courses/ruby-programming/lessons/data-structures-and-algorithms?ref=lnav)
sets the challenge of creating a function to show the simplest possible way for
a knight in chess to move from one square to another.

The function 'knight_moves' is defined in main.rb and it takes a
Starting Position and an End position (both represented by an array
of two coordinates between 0 and 7). It then creates a tree from the
Starting posititon and proceeds to do a level-order search through
the tree. A Node in the Tree represents a Square on the Chess board
and a Node's neighbours represent all possible Squares that a Knight
can go to from this Square.

After the level-order search finishes and the square is found I had
some trouble reconstructing the shortest path just from the Node
that corresponds to the End position. So I decided to inlcude the
parent node in each call to find_path. Once the correct node was
found, the function appends the End Node to the path and returns the
path, AS WELL AS it's parent. The previous caller then checks if it
is the parent and appends itself if so, otherwise it just passes the
parent and path on unmodified.

Finally I just had to reverse the path so that the first move is
also the first element of the result.

