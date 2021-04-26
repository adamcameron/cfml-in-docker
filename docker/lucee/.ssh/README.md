# Github access keys

## Usage
For the container to be able to access Github, one needs to drop a `id_ed25519` private key file in this directory
that matches a public key already added to Github.

Also one can drop a `known_hosts` file in here that identifies `github.com` as a known host. This is optional,
but it prevents the container build process asking you to confirm the host can be trusted.

## <span style="color:red">Warning</span>

<span style="color:red">
    It is imperative that the <samp>id_rsa</samp> file or any other private key files are not committed to source control.
    They contain private personal information that must not be shared.
</span>
