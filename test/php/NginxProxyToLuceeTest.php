<?php

namespace adamCameron\cfmlInDocker\test;

use GuzzleHttp\Client;
use PHPUnit\Framework\TestCase;

/** @testdox Tests Nginx proxies CFML requests to Lucee */
class NginxProxyToLuceeTest extends TestCase
{

    /** @testdox It proxies a CFM request to Lucee */
    public function testCfmReturns200OK()
    {
        $client = new Client(['base_uri' => 'http://cfml-in-docker.frontend/']);

        $response = $client->get('gdayWorld.cfm');

        $this->assertEquals(200, $response->getStatusCode());
        $content = $response->getBody()->getContents();
        $this->assertSame("G'day world!", trim($content));
    }

    /** @testdox It passes query values to Lucee */
    public function testCfmReceivesQueryParameters()
    {
        $client = new Client([
            'base_uri' => 'http://cfml-in-docker.frontend/',
            'http_errors' => false
        ]);

        $response = $client->get('queryTest.cfm?testParam=expectedValue');

        $this->assertEquals(200, $response->getStatusCode());
        $content = $response->getBody()->getContents();
        $this->assertSame("expectedValue", trim($content));
    }

    /** @testdox It passes the upstream remote address to Lucee */
    public function testLuceeReceivesCorrectRemoteAddr()
    {
        $directClient = new Client([
            'base_uri' => 'http://cfml-in-docker.lucee:8888/',
            'http_errors' => false
        ]);
        $response = $directClient->get('remoteAddrTest.cfm');
        $expectedRemoteAddr = $response->getBody()->getContents();

        $proxiedClient = new Client([
            'base_uri' => 'http://cfml-in-docker.frontend/',
            'http_errors' => false
        ]);

        $testResponse = $proxiedClient->get('remoteAddrTest.cfm');

        $this->assertEquals(200, $testResponse->getStatusCode());
        $actualRemoteAddr = $testResponse->getBody()->getContents();
        $this->assertSame($expectedRemoteAddr, $actualRemoteAddr);
    }

    /** @testdox It passes URL path_info to Lucee correctly */
    public function testLuceeReceivesPathInfo()
    {
        $this->markTestIncomplete('Lucee has a bug with how it handles PATH_INFO, so this test will not pass currently');
        $client = new Client([
            'base_uri' => 'http://cfml-in-docker.frontend/',
            'http_errors' => false
        ]);

        $response = $client->get('pathInfoTest.cfm/additional/path/info/');

        $this->assertEquals(200, $response->getStatusCode());
        $content = $response->getBody()->getContents();
        $this->assertSame("/additional/path/info/", trim($content));
    }
}
