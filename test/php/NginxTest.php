<?php

namespace adamCameron\cfmlInDocker\test;

use GuzzleHttp\Client;
use PHPUnit\Framework\TestCase;

/** @testdox Tests Nginx is serving html */
class NginxTest extends TestCase
{
    /** @testdox It serves gdayWorld.html as 200-OK */
    public function testHtmlReturns200OK()
    {
        $client = new Client(['base_uri' => 'http://cfml-in-docker.frontend/']);

        $response = $client->get('gdayWorld.html');

        $this->assertEquals(200, $response->getStatusCode());
        $content = $response->getBody()->getContents();
        $this->assertSame("G'day world!", trim($content));
    }
}
