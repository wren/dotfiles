<?php

declare(strict_types=1);

namespace GuzzleHttp\Psr7;

use Psr\Http\Message\RequestFactoryInterface;
use Psr\Http\Message\ResponseFactoryInterface;
use Psr\Http\Message\ServerRequestFactoryInterface;
use Psr\Http\Message\StreamFactoryInterface;
use Psr\Http\Message\UploadedFileFactoryInterface;
use Psr\Http\Message\UriFactoryInterface;
use Psr\Http\Message\RequestInterface;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Message\StreamInterface;
use Psr\Http\Message\UploadedFileInterface;
use Psr\Http\Message\UriInterface;

/**
 * Implements all of the PSR-17 interfaces.
 *
 * Note: in consuming code it is recommended to require the implemented interfaces
 * and inject the instance of this class multiple times.
 */
final class HttpFactory implements
    RequestFactoryInterface,
    ResponseFactoryInterface,
    ServerRequestFactoryInterface,
    StreamFactoryInterface,
    UploadedFileFactoryInterface,
    UriFactoryInterface
{
    /**
     * {@inheritdoc}
     */
    public function createUploadedFile(
        StreamInterface $stream,
        int $size = null,
        int $error = \UPLOAD_ERR_OK,
        string $clientFilename = null,
        string $clientMediaType = null
    ): UploadedFileInterface {
        if ($size === null) {
            $size = $stream->getSize();
        }

        return new UploadedFile($stream, $size, $error, $clientFilename, $clientMediaType);
    }

    /**
     * {@inheritdoc}
     */
    public function createStream(string $content = ''): StreamInterface
    {
        return \GuzzleHttp\Psr7\stream_for($content);
    }

    /**
     * {@inheritdoc}
     */
    public function createStreamFromFile(string $file, string $mode = 'r'): StreamInterface
    {
        try {
            $resource = \GuzzleHttp\Psr7\try_fopen($file, $mode);
        } catch (\RuntimeException $e) {
            if ('' === $mode || false === \in_array($mode[0], ['r', 'w', 'a', 'x', 'c'], true)) {
                throw new \InvalidArgumentException(sprintf('Invalid file opening mode "%s"', $mode), 0, $e);
            }

            throw $e;
        }

        return \GuzzleHttp\Psr7\stream_for($resource);
    }

    /**
     * {@inheritdoc}
     */
    public function createStreamFromResource($resource): StreamInterface
    {
        return \GuzzleHttp\Psr7\stream_for($resource);
    }

    /**
     * {@inheritdoc}
     */
    public function createServerRequest(string $method, $uri, array $serverParams = []): ServerRequestInterface
    {
        if (empty($method)) {
            if (!empty($serverParams['REQUEST_METHOD'])) {
                $method = $serverParams['REQUEST_METHOD'];
            } else {
                throw new \InvalidArgumentException('Cannot determine HTTP method');
            }
        }

        return new ServerRequest($method, $uri, [], null, '1.1', $serverParams);
    }

    /**
     * {@inheritdoc}
     */
    public function createResponse(int $code = 200, string $reasonPhrase = ''): ResponseInterface
    {
        return new Response($code, [], null, '1.1', $reasonPhrase);
    }

    /**
     * {@inheritdoc}
     */
    public function createRequest(string $method, $uri): RequestInterface
    {
        return new Request($method, $uri);
    }

    /**
     * {@inheritdoc}
     */
    public function createUri(string $uri = ''): UriInterface
    {
        return new Uri($uri);
    }
}
