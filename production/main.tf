locals {
    test1 = "this is the output of test 1"
    test2 = "this is the output of test 2"
}

output test1{
    value = local.test2
}

output test2{
    value = local.test2
}