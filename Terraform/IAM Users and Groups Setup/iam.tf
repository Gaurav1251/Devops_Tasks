/*


day 1


resource "aws_iam_user" "g1"  {
  name = "gk"
}
resource "aws_iam_user" "g2" {
  name = "shivam"
}
resource "aws_iam_user" "g3" {
  name = "rushi"
}
resource "aws_iam_group" "pune" {
  name = "pune"
}

resource "aws_iam_group_membership" "pune" {
  name = "pune"
  users = [ aws_iam_user.g1.name,aws_iam_user.g2.name,aws_iam_user.g3.name ]
  group = aws_iam_group.pune.name
}*/




