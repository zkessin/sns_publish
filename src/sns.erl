-module(sns).

-export([publish/3]).

publish(Topic, Subject, Message) ->
  aws_credentials:s3(),
  Params = [{"Subject", Subject},
            {"TopicArn", Topic},
            {"AWSAccesKeyId", "AccessKey"},
            {"Message", Message}, 
            {"Action", "Publish"}],

  Config = erlcloud_aws:default_config(),
  erlcloud_aws:aws_request2('post', "https" , "sns.us-east-1.amazonaws.com", 443, "/", Params,  Config).
