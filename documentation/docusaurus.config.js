const lightCodeTheme = require('prism-react-renderer/themes/github');
const darkCodeTheme = require('prism-react-renderer/themes/dracula');

module.exports = {
  title: 'Blueprints',
  tagline: '',
  url: 'https://xebialabs.github.io',
  baseUrl: '/blueprints/',
  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',
  favicon: 'img/digital_ai_deploy.svg',
  organizationName: 'Digital.ai',
  projectName: 'blueprints',
  themeConfig: {
    navbar: {
      title: 'Blueprints',
      logo: {
        alt: 'Blueprints Digital.ai',
        src: 'img/digital_ai_deploy.svg',
      },
      items: [
        {
          type: 'doc',
          docId: 'intro',
          position: 'left',
          label: 'Tutorial',
        },

        {
          href: 'https://github.com/xebialabs/blueprints',
          label: 'GitHub',
          position: 'right',
        }
      ],
    },
    footer: {
      style: 'dark',
      links: [
        {
          title: 'Docs',
          items: [
            {
              label: 'Tutorial',
              to: '/docs/intro',
            },
            {
              label: 'GitHub',
              href: 'https://github.com/xebialabs/blueprints',
            },
          ],
        },
      ],
      copyright: `Copyright © ${new Date().getFullYear()} Blueprints Digital.ai`,
    },
    prism: {
      theme: lightCodeTheme,
      darkTheme: darkCodeTheme,
    },
  },
  presets: [
    [
      '@docusaurus/preset-classic',
      {
        docs: {
          sidebarPath: require.resolve('./sidebars.js')
        },
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      },
    ],
  ],
};
