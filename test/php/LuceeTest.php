<?php

namespace adamCameron\cfmlInDocker\test;

use GuzzleHttp\Client;
use PHPUnit\Framework\TestCase;

/** @testdox Tests Lucee is serving cfml */
class LuceeTest extends TestCase
{
    /** @testdox It serves gdayWorld.cfm as 200-OK on Lucee's internal web server */
    public function testReturns200OK()
    {
        $client = new Client(['base_uri' => 'http://cfml-in-docker.lucee:8888/']);

        $response = $client->get('gdayWorld.cfm');

        $this->assertEquals(200, $response->getStatusCode());
        $content = $response->getBody()->getContents();
        $this->assertMatchesRegularExpression("/^\\s*G'day world!\\s*$/", $content);
    }
}
