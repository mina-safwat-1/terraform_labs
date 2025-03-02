

resource "aws_elasticache_subnet_group" "elasticache_subnet_group" {
  name       = "tf-test-cache-subnet"
  subnet_ids = [module.network_module.subnets["priv_subnet_1"].id, module.network_module.subnets["priv_subnet_2"].id]
}


resource "aws_elasticache_cluster" "elasticache_cluster" {
  cluster_id           = "cluster-example"
  engine               = "redis"
  node_type            = "cache.t3.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis7"
  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.elasticache_subnet_group.name
}