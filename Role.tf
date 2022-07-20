resource "aws_iam_openid_connect_provider" "default" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = ["sts.amazonaws.com"]

  thumbprint_list = ["6938fd4d98bab03faadb97b34396831e3780aea1"]
}

data "aws_iam_policy_document" "Github_policy_1" {
  statement {
    sid     = "github"
    actions = ["sts:AssumeRoleWithWebIdentity"]
    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.default.arn]
    }
    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }
    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values   = ["repo:Ghaneshkarthick/*:*"]
    }
  }
}

resource "aws_iam_role" "Github_actions" {
  name               = "Github-actions-oidc"
  assume_role_policy = data.aws_iam_policy_document.Github_policy_1.json
}
resource "aws_iam_role_policy_attachment" "github_actions_attach" {
  role       = aws_iam_role.Github_actions.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
