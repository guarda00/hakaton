# Composer-enabled Drupal template

This is Pantheon's recommended starting point for forking new [Drupal](https://www.drupal.org/) upstreams
that work with the Platform's Integrated Composer build process. It is also the
Platform's standard Drupal 9 upstream.

Unlike with earlier Pantheon upstreams, files such as Drupal Core that you are
unlikely to adjust while building sites are not in the main branch of the 
repository. Instead, they are referenced as dependencies that are installed by
Composer.

For more information and detailed installation guides, please visit the
Integrated Composer Pantheon documentation: https://pantheon.io/docs/integrated-composer

## Local development with Lando

The project uses Drupal 11 and PHP 8.3. To configure automatic Pantheon login:

```bash
cp .env.lando.example .env.lando
chmod 600 .env.lando
```

Set `PANTHEON_MACHINE_TOKEN` in `.env.lando` to a token created in the
[Pantheon dashboard](https://dashboard.pantheon.io/machine-token/create).
The local file is ignored by Git. Keep the token private.

```bash
lando start
lando composer install
lando terminus auth:whoami
```

The appserver's `post-start` hook reads `.env.lando` and authenticates Terminus
on each start. Missing or invalid tokens do not prevent local services from
running. After changing the token, run `lando restart` to retry authentication.
This logs in to Pantheon; it does not import the site's database or files.

## Contributing

Contributions are welcome in the form of GitHub pull requests. However, the
`pantheon-upstreams/drupal-composer-managed` repository is a mirror that does not
directly accept pull requests.

Instead, to propose a change, please fork [pantheon-systems/drupal-composer-managed](https://github.com/pantheon-systems/drupal-composer-managed)
and submit a PR to that repository.
