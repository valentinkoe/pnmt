



<!DOCTYPE html>
<html lang="en" class=" is-copy-enabled">
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# object: http://ogp.me/ns/object# article: http://ogp.me/ns/article# profile: http://ogp.me/ns/profile#">
    <meta charset='utf-8'>
    

    <link crossorigin="anonymous" href="https://assets-cdn.github.com/assets/frameworks-31e369ccd2b23a1eccde83f03ef36eafff1f7b9025f6042ccac33a7915753de2.css" integrity="sha256-MeNpzNKyOh7M3oPwPvNur/8fe5Al9gQsysM6eRV1PeI=" media="all" rel="stylesheet" />
    <link crossorigin="anonymous" href="https://assets-cdn.github.com/assets/github-f52c8c687f8b759e77e94e3641edb1c5f49d6e8e0738ef162a66361316566cff.css" integrity="sha256-9SyMaH+LdZ536U42Qe2xxfSdbo4HOO8WKmY2ExZWbP8=" media="all" rel="stylesheet" />
    
    
    
    

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    <meta name="viewport" content="width=device-width">
    
    <title>mosesdecoder/detokenizer.perl at master · moses-smt/mosesdecoder</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub">
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub">
    <link rel="apple-touch-icon" href="/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="/apple-touch-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/apple-touch-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="/apple-touch-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="/apple-touch-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon-180x180.png">
    <meta property="fb:app_id" content="1401488693436528">

      <meta content="https://avatars0.githubusercontent.com/u/1038770?v=3&amp;s=400" name="twitter:image:src" /><meta content="@github" name="twitter:site" /><meta content="summary" name="twitter:card" /><meta content="moses-smt/mosesdecoder" name="twitter:title" /><meta content="mosesdecoder - Moses, the machine translation system" name="twitter:description" />
      <meta content="https://avatars0.githubusercontent.com/u/1038770?v=3&amp;s=400" property="og:image" /><meta content="GitHub" property="og:site_name" /><meta content="object" property="og:type" /><meta content="moses-smt/mosesdecoder" property="og:title" /><meta content="https://github.com/moses-smt/mosesdecoder" property="og:url" /><meta content="mosesdecoder - Moses, the machine translation system" property="og:description" />
      <meta name="browser-stats-url" content="https://api.github.com/_private/browser/stats">
    <meta name="browser-errors-url" content="https://api.github.com/_private/browser/errors">
    <link rel="assets" href="https://assets-cdn.github.com/">
    <link rel="web-socket" href="wss://live.github.com/_sockets/ODU4MTE5OToyNmEyZWY2NzZjMTBjNTc0NTZmNGYxOGQ1YWY5NmYzNTpjMmQ5YjAwMTQzMjNlYzFkMjE2ZjFiMmMwOTg2NDI3M2E5ZjdmZTAxZDkxMDQ5NWNkZTE2NTQ4Zjc2ZGZjYTg5--aaef580cfb1cd045f89e1b3c435c6ce72b21c65a">
    <meta name="pjax-timeout" content="1000">
    <link rel="sudo-modal" href="/sessions/sudo_modal">
    <meta name="request-id" content="8AF602E8:14AEC:F5AF72F:582C9046" data-pjax-transient>

    <meta name="msapplication-TileImage" content="/windows-tile.png">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="selected-link" value="repo_source" data-pjax-transient>

    <meta name="google-site-verification" content="KT5gs8h0wvaagLKAVWq8bbeNwnZZK1r1XQysX3xurLU">
<meta name="google-site-verification" content="ZzhVyEFwb7w3e0-uOTltm8Jsck2F5StVihD0exw2fsA">
    <meta name="google-analytics" content="UA-3769691-2">

<meta content="collector.githubapp.com" name="octolytics-host" /><meta content="github" name="octolytics-app-id" /><meta content="8AF602E8:14AEC:F5AF72F:582C9046" name="octolytics-dimension-request_id" /><meta content="8581199" name="octolytics-actor-id" /><meta content="valentindey" name="octolytics-actor-login" /><meta content="1100814d9ea6cee6f292eef870577229057c8b13cd9c36a53d23d615cabad121" name="octolytics-actor-hash" />
<meta content="/&lt;user-name&gt;/&lt;repo-name&gt;/blob/show" data-pjax-transient="true" name="analytics-location" />



  <meta class="js-ga-set" name="dimension1" content="Logged In">



        <meta name="hostname" content="github.com">
    <meta name="user-login" content="valentindey">

        <meta name="expected-hostname" content="github.com">
      <meta name="js-proxy-site-detection-payload" content="NjE5NTJlMzljZmU1NTcyZjY5ZDlmY2NlODBhYTljMjdjY2JiNDQ3NjRmNGJmYzEzOTg0MDU1ZWY2ZDQzNGIzZXx7InJlbW90ZV9hZGRyZXNzIjoiMTM4LjI0Ni4yLjIzMiIsInJlcXVlc3RfaWQiOiI4QUY2MDJFODoxNEFFQzpGNUFGNzJGOjU4MkM5MDQ2IiwidGltZXN0YW1wIjoxNDc5MzE1NTI3LCJob3N0IjoiZ2l0aHViLmNvbSJ9">


      <link rel="mask-icon" href="https://assets-cdn.github.com/pinned-octocat.svg" color="#4078c0">
      <link rel="icon" type="image/x-icon" href="https://assets-cdn.github.com/favicon.ico">

    <meta name="html-safe-nonce" content="00af69b36a67e6ee9527a1635dc470c8360432bb">
    <meta content="b91d33701d4366726ae0a899425e2c0914a1a507" name="form-nonce" />

    <meta http-equiv="x-pjax-version" content="863c5d3a289f231b4226e71fee0c8cf7">
    

      
  <meta name="description" content="mosesdecoder - Moses, the machine translation system">
  <meta name="go-import" content="github.com/moses-smt/mosesdecoder git https://github.com/moses-smt/mosesdecoder.git">

  <meta content="1038770" name="octolytics-dimension-user_id" /><meta content="moses-smt" name="octolytics-dimension-user_login" /><meta content="2236146" name="octolytics-dimension-repository_id" /><meta content="moses-smt/mosesdecoder" name="octolytics-dimension-repository_nwo" /><meta content="true" name="octolytics-dimension-repository_public" /><meta content="false" name="octolytics-dimension-repository_is_fork" /><meta content="2236146" name="octolytics-dimension-repository_network_root_id" /><meta content="moses-smt/mosesdecoder" name="octolytics-dimension-repository_network_root_nwo" />
  <link href="https://github.com/moses-smt/mosesdecoder/commits/master.atom" rel="alternate" title="Recent Commits to mosesdecoder:master" type="application/atom+xml">


      <link rel="canonical" href="https://github.com/moses-smt/mosesdecoder/blob/master/scripts/tokenizer/detokenizer.perl" data-pjax-transient>
  </head>


  <body class="logged-in  env-production linux vis-public page-blob">
    <div id="js-pjax-loader-bar" class="pjax-loader-bar"><div class="progress"></div></div>
    <a href="#start-of-content" tabindex="1" class="accessibility-aid js-skip-to-content">Skip to content</a>

    
    
    



        <div class="header header-logged-in true" role="banner">
  <div class="container clearfix">

    <a class="header-logo-invertocat" href="https://github.com/" data-hotkey="g d" aria-label="Homepage" data-ga-click="Header, go to dashboard, icon:logo">
  <svg aria-hidden="true" class="octicon octicon-mark-github" height="28" version="1.1" viewBox="0 0 16 16" width="28"><path fill-rule="evenodd" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0 0 16 8c0-4.42-3.58-8-8-8z"/></svg>
</a>


        <div class="header-search scoped-search site-scoped-search js-site-search" role="search">
  <!-- '"` --><!-- </textarea></xmp> --></option></form><form accept-charset="UTF-8" action="/moses-smt/mosesdecoder/search" class="js-site-search-form" data-scoped-search-url="/moses-smt/mosesdecoder/search" data-unscoped-search-url="/search" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
    <label class="form-control header-search-wrapper js-chromeless-input-container">
      <div class="header-search-scope">This repository</div>
      <input type="text"
        class="form-control header-search-input js-site-search-focus js-site-search-field is-clearable"
        data-hotkey="s"
        name="q"
        placeholder="Search"
        aria-label="Search this repository"
        data-unscoped-placeholder="Search GitHub"
        data-scoped-placeholder="Search"
        autocapitalize="off">
    </label>
</form></div>


      <ul class="header-nav float-left" role="navigation">
        <li class="header-nav-item">
          <a href="/pulls" aria-label="Pull requests you created" class="js-selected-navigation-item header-nav-link" data-ga-click="Header, click, Nav menu - item:pulls context:user" data-hotkey="g p" data-selected-links="/pulls /pulls/assigned /pulls/mentioned /pulls">
            Pull requests
</a>        </li>
        <li class="header-nav-item">
          <a href="/issues" aria-label="Issues you created" class="js-selected-navigation-item header-nav-link" data-ga-click="Header, click, Nav menu - item:issues context:user" data-hotkey="g i" data-selected-links="/issues /issues/assigned /issues/mentioned /issues">
            Issues
</a>        </li>
          <li class="header-nav-item">
            <a class="header-nav-link" href="https://gist.github.com/" data-ga-click="Header, go to gist, text:gist">Gist</a>
          </li>
      </ul>

    
<ul class="header-nav user-nav float-right" id="user-links">
  <li class="header-nav-item">
    
    <a href="/notifications" aria-label="You have no unread notifications" class="header-nav-link notification-indicator tooltipped tooltipped-s js-socket-channel js-notification-indicator" data-channel="tenant:1:notification-changed:8581199" data-ga-click="Header, go to notifications, icon:read" data-hotkey="g n">
        <span class="mail-status "></span>
        <svg aria-hidden="true" class="octicon octicon-bell" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path fill-rule="evenodd" d="M14 12v1H0v-1l.73-.58c.77-.77.81-2.55 1.19-4.42C2.69 3.23 6 2 6 2c0-.55.45-1 1-1s1 .45 1 1c0 0 3.39 1.23 4.16 5 .38 1.88.42 3.66 1.19 4.42l.66.58H14zm-7 4c1.11 0 2-.89 2-2H5c0 1.11.89 2 2 2z"/></svg>
</a>
  </li>

  <li class="header-nav-item dropdown js-menu-container">
    <a class="header-nav-link tooltipped tooltipped-s js-menu-target" href="/new"
       aria-label="Create new…"
       data-ga-click="Header, create new, icon:add">
      <svg aria-hidden="true" class="octicon octicon-plus float-left" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 9H7v5H5V9H0V7h5V2h2v5h5z"/></svg>
      <span class="dropdown-caret"></span>
    </a>

    <div class="dropdown-menu-content js-menu-content">
      <ul class="dropdown-menu dropdown-menu-sw">
        
<a class="dropdown-item" href="/new" data-ga-click="Header, create new repository">
  New repository
</a>

  <a class="dropdown-item" href="/new/import" data-ga-click="Header, import a repository">
    Import repository
  </a>

<a class="dropdown-item" href="https://gist.github.com/" data-ga-click="Header, create new gist">
  New gist
</a>

  <a class="dropdown-item" href="/organizations/new" data-ga-click="Header, create new organization">
    New organization
  </a>



  <div class="dropdown-divider"></div>
  <div class="dropdown-header">
    <span title="moses-smt/mosesdecoder">This repository</span>
  </div>
    <a class="dropdown-item" href="/moses-smt/mosesdecoder/issues/new" data-ga-click="Header, create new issue">
      New issue
    </a>

      </ul>
    </div>
  </li>

  <li class="header-nav-item dropdown js-menu-container">
    <a class="header-nav-link name tooltipped tooltipped-sw js-menu-target" href="/valentindey"
       aria-label="View profile and more"
       data-ga-click="Header, show menu, icon:avatar">
      <img alt="@valentindey" class="avatar" height="20" src="https://avatars0.githubusercontent.com/u/8581199?v=3&amp;s=40" width="20" />
      <span class="dropdown-caret"></span>
    </a>

    <div class="dropdown-menu-content js-menu-content">
      <div class="dropdown-menu dropdown-menu-sw">
        <div class="dropdown-header header-nav-current-user css-truncate">
          Signed in as <strong class="css-truncate-target">valentindey</strong>
        </div>

        <div class="dropdown-divider"></div>

        <a class="dropdown-item" href="/valentindey" data-ga-click="Header, go to profile, text:your profile">
          Your profile
        </a>
        <a class="dropdown-item" href="/valentindey?tab=stars" data-ga-click="Header, go to starred repos, text:your stars">
          Your stars
        </a>
        <a class="dropdown-item" href="/explore" data-ga-click="Header, go to explore, text:explore">
          Explore
        </a>
          <a class="dropdown-item" href="/integrations" data-ga-click="Header, go to integrations, text:integrations">
            Integrations
          </a>
        <a class="dropdown-item" href="https://help.github.com" data-ga-click="Header, go to help, text:help">
          Help
        </a>

        <div class="dropdown-divider"></div>

        <a class="dropdown-item" href="/settings/profile" data-ga-click="Header, go to settings, icon:settings">
          Settings
        </a>

        <!-- '"` --><!-- </textarea></xmp> --></option></form><form accept-charset="UTF-8" action="/logout" class="logout-form" data-form-nonce="b91d33701d4366726ae0a899425e2c0914a1a507" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="sR8V/HhikhoRIAGDXLGw1GjgMNosGXlzaYaCrrRQZe2BrAIJ8ZGL/MmJF4H569yWnzm9q0GJSnYeVk9h1Z6D0Q==" /></div>
          <button type="submit" class="dropdown-item dropdown-signout" data-ga-click="Header, sign out, icon:logout">
            Sign out
          </button>
</form>      </div>
    </div>
  </li>
</ul>


    
  </div>
</div>


      


    <div id="start-of-content" class="accessibility-aid"></div>

      <div id="js-flash-container">
</div>


    <div role="main">
        <div itemscope itemtype="http://schema.org/SoftwareSourceCode">
    <div id="js-repo-pjax-container" data-pjax-container>
      
<div class="pagehead repohead instapaper_ignore readability-menu experiment-repo-nav">
  <div class="container repohead-details-container">

    

<ul class="pagehead-actions">

  <li>
        <!-- '"` --><!-- </textarea></xmp> --></option></form><form accept-charset="UTF-8" action="/notifications/subscribe" class="js-social-container" data-autosubmit="true" data-form-nonce="b91d33701d4366726ae0a899425e2c0914a1a507" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="Arjr89aLWwuxa8YYy1YLfKLGVkeScCGCG8/LGCPVDLPCvjhk7Kl0NC2k7MPv1SUB3P/N/8HuzkwXyWLU8fS13A==" /></div>      <input class="form-control" id="repository_id" name="repository_id" type="hidden" value="2236146" />

        <div class="select-menu js-menu-container js-select-menu">
          <a href="/moses-smt/mosesdecoder/subscription"
            class="btn btn-sm btn-with-count select-menu-button js-menu-target" role="button" tabindex="0" aria-haspopup="true"
            data-ga-click="Repository, click Watch settings, action:blob#show">
            <span class="js-select-button">
              <svg aria-hidden="true" class="octicon octicon-eye" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M8.06 2C3 2 0 8 0 8s3 6 8.06 6C13 14 16 8 16 8s-3-6-7.94-6zM8 12c-2.2 0-4-1.78-4-4 0-2.2 1.8-4 4-4 2.22 0 4 1.8 4 4 0 2.22-1.78 4-4 4zm2-4c0 1.11-.89 2-2 2-1.11 0-2-.89-2-2 0-1.11.89-2 2-2 1.11 0 2 .89 2 2z"/></svg>
              Watch
            </span>
          </a>
          <a class="social-count js-social-count"
            href="/moses-smt/mosesdecoder/watchers"
            aria-label="141 users are watching this repository">
            141
          </a>

        <div class="select-menu-modal-holder">
          <div class="select-menu-modal subscription-menu-modal js-menu-content" aria-hidden="true">
            <div class="select-menu-header js-navigation-enable" tabindex="-1">
              <svg aria-label="Close" class="octicon octicon-x js-menu-close" height="16" role="img" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48z"/></svg>
              <span class="select-menu-title">Notifications</span>
            </div>

              <div class="select-menu-list js-navigation-container" role="menu">

                <div class="select-menu-item js-navigation-item selected" role="menuitem" tabindex="0">
                  <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
                  <div class="select-menu-item-text">
                    <input checked="checked" id="do_included" name="do" type="radio" value="included" />
                    <span class="select-menu-item-heading">Not watching</span>
                    <span class="description">Be notified when participating or @mentioned.</span>
                    <span class="js-select-button-text hidden-select-button-text">
                      <svg aria-hidden="true" class="octicon octicon-eye" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M8.06 2C3 2 0 8 0 8s3 6 8.06 6C13 14 16 8 16 8s-3-6-7.94-6zM8 12c-2.2 0-4-1.78-4-4 0-2.2 1.8-4 4-4 2.22 0 4 1.8 4 4 0 2.22-1.78 4-4 4zm2-4c0 1.11-.89 2-2 2-1.11 0-2-.89-2-2 0-1.11.89-2 2-2 1.11 0 2 .89 2 2z"/></svg>
                      Watch
                    </span>
                  </div>
                </div>

                <div class="select-menu-item js-navigation-item " role="menuitem" tabindex="0">
                  <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
                  <div class="select-menu-item-text">
                    <input id="do_subscribed" name="do" type="radio" value="subscribed" />
                    <span class="select-menu-item-heading">Watching</span>
                    <span class="description">Be notified of all conversations.</span>
                    <span class="js-select-button-text hidden-select-button-text">
                      <svg aria-hidden="true" class="octicon octicon-eye" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M8.06 2C3 2 0 8 0 8s3 6 8.06 6C13 14 16 8 16 8s-3-6-7.94-6zM8 12c-2.2 0-4-1.78-4-4 0-2.2 1.8-4 4-4 2.22 0 4 1.8 4 4 0 2.22-1.78 4-4 4zm2-4c0 1.11-.89 2-2 2-1.11 0-2-.89-2-2 0-1.11.89-2 2-2 1.11 0 2 .89 2 2z"/></svg>
                      Unwatch
                    </span>
                  </div>
                </div>

                <div class="select-menu-item js-navigation-item " role="menuitem" tabindex="0">
                  <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
                  <div class="select-menu-item-text">
                    <input id="do_ignore" name="do" type="radio" value="ignore" />
                    <span class="select-menu-item-heading">Ignoring</span>
                    <span class="description">Never be notified.</span>
                    <span class="js-select-button-text hidden-select-button-text">
                      <svg aria-hidden="true" class="octicon octicon-mute" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M8 2.81v10.38c0 .67-.81 1-1.28.53L3 10H1c-.55 0-1-.45-1-1V7c0-.55.45-1 1-1h2l3.72-3.72C7.19 1.81 8 2.14 8 2.81zm7.53 3.22l-1.06-1.06-1.97 1.97-1.97-1.97-1.06 1.06L11.44 8 9.47 9.97l1.06 1.06 1.97-1.97 1.97 1.97 1.06-1.06L13.56 8l1.97-1.97z"/></svg>
                      Stop ignoring
                    </span>
                  </div>
                </div>

              </div>

            </div>
          </div>
        </div>
</form>
  </li>

  <li>
    
  <div class="js-toggler-container js-social-container starring-container ">

    <!-- '"` --><!-- </textarea></xmp> --></option></form><form accept-charset="UTF-8" action="/moses-smt/mosesdecoder/unstar" class="starred" data-form-nonce="b91d33701d4366726ae0a899425e2c0914a1a507" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="92XyNBL/gOnDW4pXjBFSDSGe+b4xAKahA4aziydSoFttzatPRZ8J3wlh7+qPI4RWh27Wm0gPwhbj+e0rTxLSCA==" /></div>
      <button
        type="submit"
        class="btn btn-sm btn-with-count js-toggler-target"
        aria-label="Unstar this repository" title="Unstar moses-smt/mosesdecoder"
        data-ga-click="Repository, click unstar button, action:blob#show; text:Unstar">
        <svg aria-hidden="true" class="octicon octicon-star" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74z"/></svg>
        Unstar
      </button>
        <a class="social-count js-social-count" href="/moses-smt/mosesdecoder/stargazers"
           aria-label="496 users starred this repository">
          496
        </a>
</form>
    <!-- '"` --><!-- </textarea></xmp> --></option></form><form accept-charset="UTF-8" action="/moses-smt/mosesdecoder/star" class="unstarred" data-form-nonce="b91d33701d4366726ae0a899425e2c0914a1a507" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="yWQWPRNbzrzUHWHWHWFHISJgIJz1mGjyoWFSTNdL6ivBtsapto4PmllujSjrr9GDssLMu6sK7TI5UQlHt2dLfw==" /></div>
      <button
        type="submit"
        class="btn btn-sm btn-with-count js-toggler-target"
        aria-label="Star this repository" title="Star moses-smt/mosesdecoder"
        data-ga-click="Repository, click star button, action:blob#show; text:Star">
        <svg aria-hidden="true" class="octicon octicon-star" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74z"/></svg>
        Star
      </button>
        <a class="social-count js-social-count" href="/moses-smt/mosesdecoder/stargazers"
           aria-label="496 users starred this repository">
          496
        </a>
</form>  </div>

  </li>

  <li>
          <!-- '"` --><!-- </textarea></xmp> --></option></form><form accept-charset="UTF-8" action="/moses-smt/mosesdecoder/fork" class="btn-with-count" data-form-nonce="b91d33701d4366726ae0a899425e2c0914a1a507" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="+XbnPRrkwl5LRYbfHj7AaObccIeuQBy0pXshwz8THIAB+RNfzsBiM63/Xi4w848biM4jUoP3d78IJZPIosxAMQ==" /></div>
            <button
                type="submit"
                class="btn btn-sm btn-with-count"
                data-ga-click="Repository, show fork modal, action:blob#show; text:Fork"
                title="Fork your own copy of moses-smt/mosesdecoder to your account"
                aria-label="Fork your own copy of moses-smt/mosesdecoder to your account">
              <svg aria-hidden="true" class="octicon octicon-repo-forked" height="16" version="1.1" viewBox="0 0 10 16" width="10"><path fill-rule="evenodd" d="M8 1a1.993 1.993 0 0 0-1 3.72V6L5 8 3 6V4.72A1.993 1.993 0 0 0 2 1a1.993 1.993 0 0 0-1 3.72V6.5l3 3v1.78A1.993 1.993 0 0 0 5 15a1.993 1.993 0 0 0 1-3.72V9.5l3-3V4.72A1.993 1.993 0 0 0 8 1zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3 10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3-10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
              Fork
            </button>
</form>
    <a href="/moses-smt/mosesdecoder/network" class="social-count"
       aria-label="342 users forked this repository">
      342
    </a>
  </li>
</ul>

    <h1 class="public ">
  <svg aria-hidden="true" class="octicon octicon-repo" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M4 9H3V8h1v1zm0-3H3v1h1V6zm0-2H3v1h1V4zm0-2H3v1h1V2zm8-1v12c0 .55-.45 1-1 1H6v2l-1.5-1.5L3 16v-2H1c-.55 0-1-.45-1-1V1c0-.55.45-1 1-1h10c.55 0 1 .45 1 1zm-1 10H1v2h2v-1h3v1h5v-2zm0-10H2v9h9V1z"/></svg>
  <span class="author" itemprop="author"><a href="/moses-smt" class="url fn" rel="author">moses-smt</a></span><!--
--><span class="path-divider">/</span><!--
--><strong itemprop="name"><a href="/moses-smt/mosesdecoder" data-pjax="#js-repo-pjax-container">mosesdecoder</a></strong>

</h1>

  </div>
  <div class="container">
    
<nav class="reponav js-repo-nav js-sidenav-container-pjax"
     itemscope
     itemtype="http://schema.org/BreadcrumbList"
     role="navigation"
     data-pjax="#js-repo-pjax-container">

  <span itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement">
    <a href="/moses-smt/mosesdecoder" aria-selected="true" class="js-selected-navigation-item selected reponav-item" data-hotkey="g c" data-selected-links="repo_source repo_downloads repo_commits repo_releases repo_tags repo_branches /moses-smt/mosesdecoder" itemprop="url">
      <svg aria-hidden="true" class="octicon octicon-code" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path fill-rule="evenodd" d="M9.5 3L8 4.5 11.5 8 8 11.5 9.5 13 14 8 9.5 3zm-5 0L0 8l4.5 5L6 11.5 2.5 8 6 4.5 4.5 3z"/></svg>
      <span itemprop="name">Code</span>
      <meta itemprop="position" content="1">
</a>  </span>

    <span itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement">
      <a href="/moses-smt/mosesdecoder/issues" class="js-selected-navigation-item reponav-item" data-hotkey="g i" data-selected-links="repo_issues repo_labels repo_milestones /moses-smt/mosesdecoder/issues" itemprop="url">
        <svg aria-hidden="true" class="octicon octicon-issue-opened" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path fill-rule="evenodd" d="M7 2.3c3.14 0 5.7 2.56 5.7 5.7s-2.56 5.7-5.7 5.7A5.71 5.71 0 0 1 1.3 8c0-3.14 2.56-5.7 5.7-5.7zM7 1C3.14 1 0 4.14 0 8s3.14 7 7 7 7-3.14 7-7-3.14-7-7-7zm1 3H6v5h2V4zm0 6H6v2h2v-2z"/></svg>
        <span itemprop="name">Issues</span>
        <span class="counter">3</span>
        <meta itemprop="position" content="2">
</a>    </span>

  <span itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement">
    <a href="/moses-smt/mosesdecoder/pulls" class="js-selected-navigation-item reponav-item" data-hotkey="g p" data-selected-links="repo_pulls /moses-smt/mosesdecoder/pulls" itemprop="url">
      <svg aria-hidden="true" class="octicon octicon-git-pull-request" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M11 11.28V5c-.03-.78-.34-1.47-.94-2.06C9.46 2.35 8.78 2.03 8 2H7V0L4 3l3 3V4h1c.27.02.48.11.69.31.21.2.3.42.31.69v6.28A1.993 1.993 0 0 0 10 15a1.993 1.993 0 0 0 1-3.72zm-1 2.92c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zM4 3c0-1.11-.89-2-2-2a1.993 1.993 0 0 0-1 3.72v6.56A1.993 1.993 0 0 0 2 15a1.993 1.993 0 0 0 1-3.72V4.72c.59-.34 1-.98 1-1.72zm-.8 10c0 .66-.55 1.2-1.2 1.2-.65 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
      <span itemprop="name">Pull requests</span>
      <span class="counter">1</span>
      <meta itemprop="position" content="3">
</a>  </span>

  <a href="/moses-smt/mosesdecoder/projects" class="js-selected-navigation-item reponav-item" data-selected-links="repo_projects new_repo_project repo_project /moses-smt/mosesdecoder/projects">
    <svg aria-hidden="true" class="octicon octicon-project" height="16" version="1.1" viewBox="0 0 15 16" width="15"><path fill-rule="evenodd" d="M10 12h3V2h-3v10zm-4-2h3V2H6v8zm-4 4h3V2H2v12zm-1 1h13V1H1v14zM14 0H1a1 1 0 0 0-1 1v14a1 1 0 0 0 1 1h13a1 1 0 0 0 1-1V1a1 1 0 0 0-1-1z"/></svg>
    Projects
    <span class="counter">0</span>
</a>


  <a href="/moses-smt/mosesdecoder/pulse" class="js-selected-navigation-item reponav-item" data-selected-links="pulse /moses-smt/mosesdecoder/pulse">
    <svg aria-hidden="true" class="octicon octicon-pulse" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path fill-rule="evenodd" d="M11.5 8L8.8 5.4 6.6 8.5 5.5 1.6 2.38 8H0v2h3.6l.9-1.8.9 5.4L9 8.5l1.6 1.5H14V8z"/></svg>
    Pulse
</a>
  <a href="/moses-smt/mosesdecoder/graphs" class="js-selected-navigation-item reponav-item" data-selected-links="repo_graphs repo_contributors /moses-smt/mosesdecoder/graphs">
    <svg aria-hidden="true" class="octicon octicon-graph" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M16 14v1H0V0h1v14h15zM5 13H3V8h2v5zm4 0H7V3h2v10zm4 0h-2V6h2v7z"/></svg>
    Graphs
</a>

</nav>

  </div>
</div>

<div class="container new-discussion-timeline experiment-repo-nav">
  <div class="repository-content">

    

<a href="/moses-smt/mosesdecoder/blob/9519dca56f77ee25f8b253324440d6ac5f36b9b8/scripts/tokenizer/detokenizer.perl" class="d-none js-permalink-shortcut" data-hotkey="y">Permalink</a>

<!-- blob contrib key: blob_contributors:v21:6890b44e62dfc206d96a79caf05b3d2e -->

<div class="file-navigation js-zeroclipboard-container">
  
<div class="select-menu branch-select-menu js-menu-container js-select-menu float-left">
  <button class="btn btn-sm select-menu-button js-menu-target css-truncate" data-hotkey="w"
    
    type="button" aria-label="Switch branches or tags" tabindex="0" aria-haspopup="true">
    <i>Branch:</i>
    <span class="js-select-button css-truncate-target">master</span>
  </button>

  <div class="select-menu-modal-holder js-menu-content js-navigation-container" data-pjax aria-hidden="true">

    <div class="select-menu-modal">
      <div class="select-menu-header">
        <svg aria-label="Close" class="octicon octicon-x js-menu-close" height="16" role="img" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48z"/></svg>
        <span class="select-menu-title">Switch branches/tags</span>
      </div>

      <div class="select-menu-filters">
        <div class="select-menu-text-filter">
          <input type="text" aria-label="Filter branches/tags" id="context-commitish-filter-field" class="form-control js-filterable-field js-navigation-enable" placeholder="Filter branches/tags">
        </div>
        <div class="select-menu-tabs">
          <ul>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="branches" data-filter-placeholder="Filter branches/tags" class="js-select-menu-tab" role="tab">Branches</a>
            </li>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="tags" data-filter-placeholder="Find a tag…" class="js-select-menu-tab" role="tab">Tags</a>
            </li>
          </ul>
        </div>
      </div>

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="branches" role="menu">

        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/BEFORE_FF_FRAMEWORK/scripts/tokenizer/detokenizer.perl"
               data-name="BEFORE_FF_FRAMEWORK"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                BEFORE_FF_FRAMEWORK
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/CheckTargetNgrams/scripts/tokenizer/detokenizer.perl"
               data-name="CheckTargetNgrams"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                CheckTargetNgrams
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/CompactPT/scripts/tokenizer/detokenizer.perl"
               data-name="CompactPT"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                CompactPT
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/DPR_MOSES/scripts/tokenizer/detokenizer.perl"
               data-name="DPR_MOSES"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                DPR_MOSES
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/FF_ttptr/scripts/tokenizer/detokenizer.perl"
               data-name="FF_ttptr"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                FF_ttptr
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/GHK/scripts/tokenizer/detokenizer.perl"
               data-name="GHK"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                GHK
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/GHKMStruct/scripts/tokenizer/detokenizer.perl"
               data-name="GHKMStruct"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                GHKMStruct
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/RELEASE-0.91/scripts/tokenizer/detokenizer.perl"
               data-name="RELEASE-0.91"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                RELEASE-0.91
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/RELEASE-1.0/scripts/tokenizer/detokenizer.perl"
               data-name="RELEASE-1.0"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                RELEASE-1.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/RELEASE-2.1/scripts/tokenizer/detokenizer.perl"
               data-name="RELEASE-2.1"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                RELEASE-2.1
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/RELEASE-2.1.1/scripts/tokenizer/detokenizer.perl"
               data-name="RELEASE-2.1.1"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                RELEASE-2.1.1
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/RELEASE-3.0/scripts/tokenizer/detokenizer.perl"
               data-name="RELEASE-3.0"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                RELEASE-3.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/abhi_discr/scripts/tokenizer/detokenizer.perl"
               data-name="abhi_discr"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                abhi_discr
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/amittai/scripts/tokenizer/detokenizer.perl"
               data-name="amittai"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                amittai
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/andre_lynum/scripts/tokenizer/detokenizer.perl"
               data-name="andre_lynum"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                andre_lynum
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/android-ui/scripts/tokenizer/detokenizer.perl"
               data-name="android-ui"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                android-ui
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/apply-coding-standard/scripts/tokenizer/detokenizer.perl"
               data-name="apply-coding-standard"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                apply-coding-standard
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/async-factors/scripts/tokenizer/detokenizer.perl"
               data-name="async-factors"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                async-factors
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/augmLMResult/scripts/tokenizer/detokenizer.perl"
               data-name="augmLMResult"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                augmLMResult
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/auli_constraint/scripts/tokenizer/detokenizer.perl"
               data-name="auli_constraint"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                auli_constraint
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/bertoldi_onlinecommand/scripts/tokenizer/detokenizer.perl"
               data-name="bertoldi_onlinecommand"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                bertoldi_onlinecommand
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/biased-bitext-sampling/scripts/tokenizer/detokenizer.perl"
               data-name="biased-bitext-sampling"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                biased-bitext-sampling
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/bilingual-lm-paul/scripts/tokenizer/detokenizer.perl"
               data-name="bilingual-lm-paul"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                bilingual-lm-paul
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/bilingual-lm/scripts/tokenizer/detokenizer.perl"
               data-name="bilingual-lm"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                bilingual-lm
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/braune_longdist/scripts/tokenizer/detokenizer.perl"
               data-name="braune_longdist"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                braune_longdist
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/cdyer-multifactor/scripts/tokenizer/detokenizer.perl"
               data-name="cdyer-multifactor"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                cdyer-multifactor
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/chardmeier-coref/scripts/tokenizer/detokenizer.perl"
               data-name="chardmeier-coref"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                chardmeier-coref
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/chardmeier-ldc/scripts/tokenizer/detokenizer.perl"
               data-name="chardmeier-ldc"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                chardmeier-ldc
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/chardmeier-lminterp/scripts/tokenizer/detokenizer.perl"
               data-name="chardmeier-lminterp"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                chardmeier-lminterp
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/chart_alignments/scripts/tokenizer/detokenizer.perl"
               data-name="chart_alignments"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                chart_alignments
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/conditional-oxlm/scripts/tokenizer/detokenizer.perl"
               data-name="conditional-oxlm"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                conditional-oxlm
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/config-switching/scripts/tokenizer/detokenizer.perl"
               data-name="config-switching"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                config-switching
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/dalsa/scripts/tokenizer/detokenizer.perl"
               data-name="dalsa"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                dalsa
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/damt-phrase2master/scripts/tokenizer/detokenizer.perl"
               data-name="damt-phrase2master"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                damt-phrase2master
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/damt_common/scripts/tokenizer/detokenizer.perl"
               data-name="damt_common"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                damt_common
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/damt_hiero/scripts/tokenizer/detokenizer.perl"
               data-name="damt_hiero"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                damt_hiero
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/damt_phrase/scripts/tokenizer/detokenizer.perl"
               data-name="damt_phrase"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                damt_phrase
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/dumb_psd/scripts/tokenizer/detokenizer.perl"
               data-name="dumb_psd"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                dumb_psd
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/dynamic-models/scripts/tokenizer/detokenizer.perl"
               data-name="dynamic-models"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                dynamic-models
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/dynamic-phrase-tables/scripts/tokenizer/detokenizer.perl"
               data-name="dynamic-phrase-tables"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                dynamic-phrase-tables
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/dynsapt/scripts/tokenizer/detokenizer.perl"
               data-name="dynsapt"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                dynsapt
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/eva_cube_pruning/scripts/tokenizer/detokenizer.perl"
               data-name="eva_cube_pruning"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                eva_cube_pruning
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/eva_maxent/scripts/tokenizer/detokenizer.perl"
               data-name="eva_maxent"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                eva_maxent
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/factored_hacks/scripts/tokenizer/detokenizer.perl"
               data-name="factored_hacks"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                factored_hacks
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/fethi/scripts/tokenizer/detokenizer.perl"
               data-name="fethi"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                fethi
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/fix-wchar-subscripts/scripts/tokenizer/detokenizer.perl"
               data-name="fix-wchar-subscripts"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                fix-wchar-subscripts
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/fscorer/scripts/tokenizer/detokenizer.perl"
               data-name="fscorer"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                fscorer
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/grace_cube_pruning_gen/scripts/tokenizer/detokenizer.perl"
               data-name="grace_cube_pruning_gen"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                grace_cube_pruning_gen
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/hierarchical-reo/scripts/tokenizer/detokenizer.perl"
               data-name="hierarchical-reo"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                hierarchical-reo
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/hieu_ftemplate_2/scripts/tokenizer/detokenizer.perl"
               data-name="hieu_ftemplate_2"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                hieu_ftemplate_2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/hieu_iphone/scripts/tokenizer/detokenizer.perl"
               data-name="hieu_iphone"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                hieu_iphone
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/hieu/scripts/tokenizer/detokenizer.perl"
               data-name="hieu"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                hieu
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/jjmoses/scripts/tokenizer/detokenizer.perl"
               data-name="jjmoses"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                jjmoses
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/jointlm_improvements/scripts/tokenizer/detokenizer.perl"
               data-name="jointlm_improvements"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                jointlm_improvements
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/josiah/scripts/tokenizer/detokenizer.perl"
               data-name="josiah"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                josiah
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/kenlm-prefetch/scripts/tokenizer/detokenizer.perl"
               data-name="kenlm-prefetch"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                kenlm-prefetch
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/lane-constraint/scripts/tokenizer/detokenizer.perl"
               data-name="lane-constraint"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                lane-constraint
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/lane-mtm3/scripts/tokenizer/detokenizer.perl"
               data-name="lane-mtm3"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                lane-mtm3
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/lane-multi/scripts/tokenizer/detokenizer.perl"
               data-name="lane-multi"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                lane-multi
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/lane-syntax/scripts/tokenizer/detokenizer.perl"
               data-name="lane-syntax"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                lane-syntax
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/lane_moses2/scripts/tokenizer/detokenizer.perl"
               data-name="lane_moses2"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                lane_moses2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/lexi-smoothing/scripts/tokenizer/detokenizer.perl"
               data-name="lexi-smoothing"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                lexi-smoothing
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/lexi_RELEASE-1.0/scripts/tokenizer/detokenizer.perl"
               data-name="lexi_RELEASE-1.0"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                lexi_RELEASE-1.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/local_lms/scripts/tokenizer/detokenizer.perl"
               data-name="local_lms"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                local_lms
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/maria_HeadDrivenFeature/scripts/tokenizer/detokenizer.perl"
               data-name="maria_HeadDrivenFeature"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                maria_HeadDrivenFeature
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/maria_MTM14/scripts/tokenizer/detokenizer.perl"
               data-name="maria_MTM14"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                maria_MTM14
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/maria_SelPref/scripts/tokenizer/detokenizer.perl"
               data-name="maria_SelPref"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                maria_SelPref
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/maria_SyntaxFeatures/scripts/tokenizer/detokenizer.perl"
               data-name="maria_SyntaxFeatures"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                maria_SyntaxFeatures
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open selected"
               href="/moses-smt/mosesdecoder/blob/master/scripts/tokenizer/detokenizer.perl"
               data-name="master"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                master
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/matecat_async/scripts/tokenizer/detokenizer.perl"
               data-name="matecat_async"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                matecat_async
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/mbotTestedDecoder/scripts/tokenizer/detokenizer.perl"
               data-name="mbotTestedDecoder"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mbotTestedDecoder
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/mbotdecoder/scripts/tokenizer/detokenizer.perl"
               data-name="mbotdecoder"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mbotdecoder
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/merge-cmd/scripts/tokenizer/detokenizer.perl"
               data-name="merge-cmd"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                merge-cmd
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/mert-mtm5/scripts/tokenizer/detokenizer.perl"
               data-name="mert-mtm5"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mert-mtm5
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/mert-other_metrics/scripts/tokenizer/detokenizer.perl"
               data-name="mert-other_metrics"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mert-other_metrics
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/mert-otherMetrics/scripts/tokenizer/detokenizer.perl"
               data-name="mert-otherMetrics"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mert-otherMetrics
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/mingw-release-2.1.1/scripts/tokenizer/detokenizer.perl"
               data-name="mingw-release-2.1.1"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mingw-release-2.1.1
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/minphr/scripts/tokenizer/detokenizer.perl"
               data-name="minphr"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                minphr
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/mira-mtm5/scripts/tokenizer/detokenizer.perl"
               data-name="mira-mtm5"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mira-mtm5
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/miramerge/scripts/tokenizer/detokenizer.perl"
               data-name="miramerge"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                miramerge
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/mjdenkowski/scripts/tokenizer/detokenizer.perl"
               data-name="mjdenkowski"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mjdenkowski
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/mmt-dev/scripts/tokenizer/detokenizer.perl"
               data-name="mmt-dev"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mmt-dev
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/mmt-merge/scripts/tokenizer/detokenizer.perl"
               data-name="mmt-merge"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mmt-merge
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/moses-batchedlm/scripts/tokenizer/detokenizer.perl"
               data-name="moses-batchedlm"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                moses-batchedlm
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/moses-server/scripts/tokenizer/detokenizer.perl"
               data-name="moses-server"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                moses-server
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/moses+batchedlm/scripts/tokenizer/detokenizer.perl"
               data-name="moses+batchedlm"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                moses+batchedlm
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/moses_cachebased/scripts/tokenizer/detokenizer.perl"
               data-name="moses_cachebased"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                moses_cachebased
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/mt3_chart/scripts/tokenizer/detokenizer.perl"
               data-name="mt3_chart"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mt3_chart
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/mt3_constraint/scripts/tokenizer/detokenizer.perl"
               data-name="mt3_constraint"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mt3_constraint
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/mtm_lm/scripts/tokenizer/detokenizer.perl"
               data-name="mtm_lm"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mtm_lm
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/mtm6-parallel-mert/scripts/tokenizer/detokenizer.perl"
               data-name="mtm6-parallel-mert"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mtm6-parallel-mert
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/mtm6_cruise_control/scripts/tokenizer/detokenizer.perl"
               data-name="mtm6_cruise_control"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mtm6_cruise_control
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/mtm15-multipass/scripts/tokenizer/detokenizer.perl"
               data-name="mtm15-multipass"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                mtm15-multipass
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/multiple-models/scripts/tokenizer/detokenizer.perl"
               data-name="multiple-models"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                multiple-models
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/multiple-models%403284/scripts/tokenizer/detokenizer.perl"
               data-name="multiple-models@3284"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                multiple-models@3284
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/ni_DPR_reordering_model/scripts/tokenizer/detokenizer.perl"
               data-name="ni_DPR_reordering_model"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ni_DPR_reordering_model
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/ni_DPR_reordering_model2/scripts/tokenizer/detokenizer.perl"
               data-name="ni_DPR_reordering_model2"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ni_DPR_reordering_model2
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/nmt-hybrid/scripts/tokenizer/detokenizer.perl"
               data-name="nmt-hybrid"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                nmt-hybrid
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/norestart/scripts/tokenizer/detokenizer.perl"
               data-name="norestart"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                norestart
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/nplm/scripts/tokenizer/detokenizer.perl"
               data-name="nplm"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                nplm
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/oovpt/scripts/tokenizer/detokenizer.perl"
               data-name="oovpt"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                oovpt
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/perf_baseline0/scripts/tokenizer/detokenizer.perl"
               data-name="perf_baseline0"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                perf_baseline0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/perf_moses2.baseline.probing10/scripts/tokenizer/detokenizer.perl"
               data-name="perf_moses2.baseline.probing10"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                perf_moses2.baseline.probing10
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/perf_moses2.baseline/scripts/tokenizer/detokenizer.perl"
               data-name="perf_moses2.baseline"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                perf_moses2.baseline
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/perf_moses2.gpulm/scripts/tokenizer/detokenizer.perl"
               data-name="perf_moses2.gpulm"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                perf_moses2.gpulm
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/prefix-private-cderscorer-member/scripts/tokenizer/detokenizer.perl"
               data-name="prefix-private-cderscorer-member"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                prefix-private-cderscorer-member
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/probing/scripts/tokenizer/detokenizer.perl"
               data-name="probing"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                probing
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/samplerank/scripts/tokenizer/detokenizer.perl"
               data-name="samplerank"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                samplerank
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/span-length/scripts/tokenizer/detokenizer.perl"
               data-name="span-length"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                span-length
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/sparse-reordering/scripts/tokenizer/detokenizer.perl"
               data-name="sparse-reordering"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                sparse-reordering
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/suffix_array/scripts/tokenizer/detokenizer.perl"
               data-name="suffix_array"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                suffix_array
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/syntaxContext/scripts/tokenizer/detokenizer.perl"
               data-name="syntaxContext"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                syntaxContext
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/ug-debug/scripts/tokenizer/detokenizer.perl"
               data-name="ug-debug"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ug-debug
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/ug-mct-find/scripts/tokenizer/detokenizer.perl"
               data-name="ug-mct-find"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                ug-mct-find
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/vw_integration/scripts/tokenizer/detokenizer.perl"
               data-name="vw_integration"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                vw_integration
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/vw_tgtcontext/scripts/tokenizer/detokenizer.perl"
               data-name="vw_tgtcontext"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                vw_tgtcontext
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/wipo/scripts/tokenizer/detokenizer.perl"
               data-name="wipo"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                wipo
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/wipoNew/scripts/tokenizer/detokenizer.perl"
               data-name="wipoNew"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                wipoNew
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/wipoNewMerger/scripts/tokenizer/detokenizer.perl"
               data-name="wipoNewMerger"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                wipoNewMerger
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/yanggao-softdep-hiero/scripts/tokenizer/detokenizer.perl"
               data-name="yanggao-softdep-hiero"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                yanggao-softdep-hiero
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/moses-smt/mosesdecoder/blob/yanggao_maxent/scripts/tokenizer/detokenizer.perl"
               data-name="yanggao_maxent"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                yanggao_maxent
              </span>
            </a>
        </div>

          <div class="select-menu-no-results">Nothing to show</div>
      </div>

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="tags">
        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/moses-smt/mosesdecoder/tree/ranked-sampling-v0.1.0/scripts/tokenizer/detokenizer.perl"
              data-name="ranked-sampling-v0.1.0"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="ranked-sampling-v0.1.0">
                ranked-sampling-v0.1.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/moses-smt/mosesdecoder/tree/pre-MMT/scripts/tokenizer/detokenizer.perl"
              data-name="pre-MMT"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="pre-MMT">
                pre-MMT
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/moses-smt/mosesdecoder/tree/mtm_before_cube_pruning/scripts/tokenizer/detokenizer.perl"
              data-name="mtm_before_cube_pruning"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="mtm_before_cube_pruning">
                mtm_before_cube_pruning
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/moses-smt/mosesdecoder/tree/mmt-mvp-v0.12.1/scripts/tokenizer/detokenizer.perl"
              data-name="mmt-mvp-v0.12.1"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="mmt-mvp-v0.12.1">
                mmt-mvp-v0.12.1
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/moses-smt/mosesdecoder/tree/mmt-mvp-v0.12.0/scripts/tokenizer/detokenizer.perl"
              data-name="mmt-mvp-v0.12.0"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="mmt-mvp-v0.12.0">
                mmt-mvp-v0.12.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/moses-smt/mosesdecoder/tree/mmt-mvp-v0.9.0/scripts/tokenizer/detokenizer.perl"
              data-name="mmt-mvp-v0.9.0"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="mmt-mvp-v0.9.0">
                mmt-mvp-v0.9.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/moses-smt/mosesdecoder/tree/mmt-mvp-v0.2.1/scripts/tokenizer/detokenizer.perl"
              data-name="mmt-mvp-v0.2.1"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="mmt-mvp-v0.2.1">
                mmt-mvp-v0.2.1
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/moses-smt/mosesdecoder/tree/mmt-mvp-0.2.0/scripts/tokenizer/detokenizer.perl"
              data-name="mmt-mvp-0.2.0"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="mmt-mvp-0.2.0">
                mmt-mvp-0.2.0
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/moses-smt/mosesdecoder/tree/mira-mtm5_on-the-fly_paramater_updates_working/scripts/tokenizer/detokenizer.perl"
              data-name="mira-mtm5_on-the-fly_paramater_updates_working"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="mira-mtm5_on-the-fly_paramater_updates_working">
                mira-mtm5_on-the-fly_paramater_updates_working
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/moses-smt/mosesdecoder/tree/eva_2d_pruning%401521/scripts/tokenizer/detokenizer.perl"
              data-name="eva_2d_pruning@1521"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="eva_2d_pruning@1521">
                eva_2d_pruning@1521
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/moses-smt/mosesdecoder/tree/eva_2d_pruning%401488/scripts/tokenizer/detokenizer.perl"
              data-name="eva_2d_pruning@1488"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="eva_2d_pruning@1488">
                eva_2d_pruning@1488
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/moses-smt/mosesdecoder/tree/eva_2d_pruning/scripts/tokenizer/detokenizer.perl"
              data-name="eva_2d_pruning"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="eva_2d_pruning">
                eva_2d_pruning
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/moses-smt/mosesdecoder/tree/START_JHU/scripts/tokenizer/detokenizer.perl"
              data-name="START_JHU"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="START_JHU">
                START_JHU
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/moses-smt/mosesdecoder/tree/SCRIPTS-RELEASE-20060802-1746/scripts/tokenizer/detokenizer.perl"
              data-name="SCRIPTS-RELEASE-20060802-1746"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="SCRIPTS-RELEASE-20060802-1746">
                SCRIPTS-RELEASE-20060802-1746
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/moses-smt/mosesdecoder/tree/SCRIPTS-RELEASE-20060801-1856/scripts/tokenizer/detokenizer.perl"
              data-name="SCRIPTS-RELEASE-20060801-1856"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="SCRIPTS-RELEASE-20060801-1856">
                SCRIPTS-RELEASE-20060801-1856
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/moses-smt/mosesdecoder/tree/SCRIPTS-RELEASE-20060731-2118/scripts/tokenizer/detokenizer.perl"
              data-name="SCRIPTS-RELEASE-20060731-2118"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="SCRIPTS-RELEASE-20060731-2118">
                SCRIPTS-RELEASE-20060731-2118
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/moses-smt/mosesdecoder/tree/SCRIPTS-RELEASE-20060731-1701/scripts/tokenizer/detokenizer.perl"
              data-name="SCRIPTS-RELEASE-20060731-1701"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="SCRIPTS-RELEASE-20060731-1701">
                SCRIPTS-RELEASE-20060731-1701
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/moses-smt/mosesdecoder/tree/Root_HIEUS_BRANCH_2006_08_15/scripts/tokenizer/detokenizer.perl"
              data-name="Root_HIEUS_BRANCH_2006_08_15"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="Root_HIEUS_BRANCH_2006_08_15">
                Root_HIEUS_BRANCH_2006_08_15
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/moses-smt/mosesdecoder/tree/RELEASE-2006-07-26/scripts/tokenizer/detokenizer.perl"
              data-name="RELEASE-2006-07-26"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="RELEASE-2006-07-26">
                RELEASE-2006-07-26
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/moses-smt/mosesdecoder/tree/RELEASE-2006-07-14/scripts/tokenizer/detokenizer.perl"
              data-name="RELEASE-2006-07-14"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="RELEASE-2006-07-14">
                RELEASE-2006-07-14
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/moses-smt/mosesdecoder/tree/LAST-SINGLE-MODEL-ONLY-2010-08-09/scripts/tokenizer/detokenizer.perl"
              data-name="LAST-SINGLE-MODEL-ONLY-2010-08-09"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="LAST-SINGLE-MODEL-ONLY-2010-08-09">
                LAST-SINGLE-MODEL-ONLY-2010-08-09
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/moses-smt/mosesdecoder/tree/LAST-PHRASE-BASED-ONLY-2010-04-08/scripts/tokenizer/detokenizer.perl"
              data-name="LAST-PHRASE-BASED-ONLY-2010-04-08"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="LAST-PHRASE-BASED-ONLY-2010-04-08">
                LAST-PHRASE-BASED-ONLY-2010-04-08
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/moses-smt/mosesdecoder/tree/HIEU_THESIS/scripts/tokenizer/detokenizer.perl"
              data-name="HIEU_THESIS"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="HIEU_THESIS">
                HIEU_THESIS
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/moses-smt/mosesdecoder/tree/BEFORE_MERGE_MAIN/scripts/tokenizer/detokenizer.perl"
              data-name="BEFORE_MERGE_MAIN"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="BEFORE_MERGE_MAIN">
                BEFORE_MERGE_MAIN
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
              href="/moses-smt/mosesdecoder/tree/ABHISHEK_THESIS/scripts/tokenizer/detokenizer.perl"
              data-name="ABHISHEK_THESIS"
              data-skip-pjax="true"
              rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target" title="ABHISHEK_THESIS">
                ABHISHEK_THESIS
              </span>
            </a>
        </div>

        <div class="select-menu-no-results">Nothing to show</div>
      </div>

    </div>
  </div>
</div>

  <div class="BtnGroup float-right">
    <a href="/moses-smt/mosesdecoder/find/master"
          class="js-pjax-capture-input btn btn-sm BtnGroup-item"
          data-pjax
          data-hotkey="t">
      Find file
    </a>
    <button aria-label="Copy file path to clipboard" class="js-zeroclipboard btn btn-sm BtnGroup-item tooltipped tooltipped-s" data-copied-hint="Copied!" type="button">Copy path</button>
  </div>
  <div class="breadcrumb js-zeroclipboard-target">
    <span class="repo-root js-repo-root"><span class="js-path-segment"><a href="/moses-smt/mosesdecoder"><span>mosesdecoder</span></a></span></span><span class="separator">/</span><span class="js-path-segment"><a href="/moses-smt/mosesdecoder/tree/master/scripts"><span>scripts</span></a></span><span class="separator">/</span><span class="js-path-segment"><a href="/moses-smt/mosesdecoder/tree/master/scripts/tokenizer"><span>tokenizer</span></a></span><span class="separator">/</span><strong class="final-path">detokenizer.perl</strong>
  </div>
</div>


  <div class="commit-tease">
      <span class="float-right">
        <a class="commit-tease-sha" href="/moses-smt/mosesdecoder/commit/ef028446f3640e007215b4576a4dc52a9c9de6db" data-pjax>
          ef02844
        </a>
        <relative-time datetime="2015-05-29T11:30:26Z">May 29, 2015</relative-time>
      </span>
      <div>
        <img alt="@jtv" class="avatar" height="20" src="https://avatars1.githubusercontent.com/u/2195859?v=3&amp;s=40" width="20" />
        <a href="/jtv" class="user-mention" rel="contributor">jtv</a>
          <a href="/moses-smt/mosesdecoder/commit/ef028446f3640e007215b4576a4dc52a9c9de6db" class="message" data-pjax="true" title="Add license notices to scripts.

This is not pleasant to read (and much, much less pleasant to write!) but
sort of necessary in an open project.  Right now it&#39;s quite hard to figure
out what is licensed how, which doesn&#39;t matter much to most people but can
suddenly become very important when people want to know what they&#39;re being
allowed to do.

I kept the notices as short as I could.  As far as I could see, everything
without a clear license notice is LGPL v2.1 or later.">Add license notices to scripts.</a>
      </div>

    <div class="commit-tease-contributors">
      <button type="button" class="btn-link muted-link contributors-toggle" data-facebox="#blob_contributors_box">
        <strong>6</strong>
         contributors
      </button>
          <a class="avatar-link tooltipped tooltipped-s" aria-label="phikoehn" href="/moses-smt/mosesdecoder/commits/master/scripts/tokenizer/detokenizer.perl?author=phikoehn"><img alt="@phikoehn" class="avatar" height="20" src="https://avatars3.githubusercontent.com/u/190904?v=3&amp;s=40" width="20" /> </a>
    <a class="avatar-link tooltipped tooltipped-s" aria-label="flammie" href="/moses-smt/mosesdecoder/commits/master/scripts/tokenizer/detokenizer.perl?author=flammie"><img alt="@flammie" class="avatar" height="20" src="https://avatars3.githubusercontent.com/u/1498282?v=3&amp;s=40" width="20" /> </a>
    <a class="avatar-link tooltipped tooltipped-s" aria-label="jtv" href="/moses-smt/mosesdecoder/commits/master/scripts/tokenizer/detokenizer.perl?author=jtv"><img alt="@jtv" class="avatar" height="20" src="https://avatars1.githubusercontent.com/u/2195859?v=3&amp;s=40" width="20" /> </a>
    <a class="avatar-link tooltipped tooltipped-s" aria-label="hieuhoang" href="/moses-smt/mosesdecoder/commits/master/scripts/tokenizer/detokenizer.perl?author=hieuhoang"><img alt="@hieuhoang" class="avatar" height="20" src="https://avatars0.githubusercontent.com/u/691732?v=3&amp;s=40" width="20" /> </a>
    <a class="avatar-link tooltipped tooltipped-s" aria-label="pjwilliams" href="/moses-smt/mosesdecoder/commits/master/scripts/tokenizer/detokenizer.perl?author=pjwilliams"><img alt="@pjwilliams" class="avatar" height="20" src="https://avatars1.githubusercontent.com/u/1104483?v=3&amp;s=40" width="20" /> </a>
    <a class="avatar-link tooltipped tooltipped-s" aria-label="bhaddow" href="/moses-smt/mosesdecoder/commits/master/scripts/tokenizer/detokenizer.perl?author=bhaddow"><img alt="@bhaddow" class="avatar" height="20" src="https://avatars2.githubusercontent.com/u/992795?v=3&amp;s=40" width="20" /> </a>


    </div>

    <div id="blob_contributors_box" style="display:none">
      <h2 class="facebox-header" data-facebox-id="facebox-header">Users who have contributed to this file</h2>
      <ul class="facebox-user-list" data-facebox-id="facebox-description">
          <li class="facebox-user-list-item">
            <img alt="@phikoehn" height="24" src="https://avatars1.githubusercontent.com/u/190904?v=3&amp;s=48" width="24" />
            <a href="/phikoehn">phikoehn</a>
          </li>
          <li class="facebox-user-list-item">
            <img alt="@flammie" height="24" src="https://avatars1.githubusercontent.com/u/1498282?v=3&amp;s=48" width="24" />
            <a href="/flammie">flammie</a>
          </li>
          <li class="facebox-user-list-item">
            <img alt="@jtv" height="24" src="https://avatars3.githubusercontent.com/u/2195859?v=3&amp;s=48" width="24" />
            <a href="/jtv">jtv</a>
          </li>
          <li class="facebox-user-list-item">
            <img alt="@hieuhoang" height="24" src="https://avatars2.githubusercontent.com/u/691732?v=3&amp;s=48" width="24" />
            <a href="/hieuhoang">hieuhoang</a>
          </li>
          <li class="facebox-user-list-item">
            <img alt="@pjwilliams" height="24" src="https://avatars3.githubusercontent.com/u/1104483?v=3&amp;s=48" width="24" />
            <a href="/pjwilliams">pjwilliams</a>
          </li>
          <li class="facebox-user-list-item">
            <img alt="@bhaddow" height="24" src="https://avatars0.githubusercontent.com/u/992795?v=3&amp;s=48" width="24" />
            <a href="/bhaddow">bhaddow</a>
          </li>
      </ul>
    </div>
  </div>

<div class="file">
  <div class="file-header">
  <div class="file-actions">

    <div class="BtnGroup">
      <a href="/moses-smt/mosesdecoder/raw/master/scripts/tokenizer/detokenizer.perl" class="btn btn-sm BtnGroup-item" id="raw-url">Raw</a>
        <a href="/moses-smt/mosesdecoder/blame/master/scripts/tokenizer/detokenizer.perl" class="btn btn-sm js-update-url-with-hash BtnGroup-item">Blame</a>
      <a href="/moses-smt/mosesdecoder/commits/master/scripts/tokenizer/detokenizer.perl" class="btn btn-sm BtnGroup-item" rel="nofollow">History</a>
    </div>


        <!-- '"` --><!-- </textarea></xmp> --></option></form><form accept-charset="UTF-8" action="/moses-smt/mosesdecoder/edit/master/scripts/tokenizer/detokenizer.perl" class="inline-form js-update-url-with-hash" data-form-nonce="b91d33701d4366726ae0a899425e2c0914a1a507" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="YpjBWIVUTO1ZIKXFtRdxNlFKGkmV+mCJLJTdgHcjQjrO+UyrljCHKTDF7YcKzHuYCRI2pcj/+Uh/Qh8B0fTGOA==" /></div>
          <button class="btn-octicon tooltipped tooltipped-nw" type="submit"
            aria-label="Fork this project and edit the file" data-hotkey="e" data-disable-with>
            <svg aria-hidden="true" class="octicon octicon-pencil" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path fill-rule="evenodd" d="M0 12v3h3l8-8-3-3-8 8zm3 2H1v-2h1v1h1v1zm10.3-9.3L12 6 9 3l1.3-1.3a.996.996 0 0 1 1.41 0l1.59 1.59c.39.39.39 1.02 0 1.41z"/></svg>
          </button>
</form>        <!-- '"` --><!-- </textarea></xmp> --></option></form><form accept-charset="UTF-8" action="/moses-smt/mosesdecoder/delete/master/scripts/tokenizer/detokenizer.perl" class="inline-form" data-form-nonce="b91d33701d4366726ae0a899425e2c0914a1a507" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="yGLZ3E3arOS8OsHcJGcbcvElLy0zu472W2apgRVcKAcjk6dKaRu5iR6MprUivAlwJJJ1dxcvJjnE7rr1XfkCUw==" /></div>
          <button class="btn-octicon btn-octicon-danger tooltipped tooltipped-nw" type="submit"
            aria-label="Fork this project and delete the file" data-disable-with>
            <svg aria-hidden="true" class="octicon octicon-trashcan" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M11 2H9c0-.55-.45-1-1-1H5c-.55 0-1 .45-1 1H2c-.55 0-1 .45-1 1v1c0 .55.45 1 1 1v9c0 .55.45 1 1 1h7c.55 0 1-.45 1-1V5c.55 0 1-.45 1-1V3c0-.55-.45-1-1-1zm-1 12H3V5h1v8h1V5h1v8h1V5h1v8h1V5h1v9zm1-10H2V3h9v1z"/></svg>
          </button>
</form>  </div>

  <div class="file-info">
      <span class="file-mode" title="File mode">executable file</span>
      <span class="file-info-divider"></span>
      374 lines (327 sloc)
      <span class="file-info-divider"></span>
    12.2 KB
  </div>
</div>

  

  <div itemprop="text" class="blob-wrapper data type-perl">
      <table class="highlight tab-size js-file-line-container" data-tab-size="8">
      <tr>
        <td id="L1" class="blob-num js-line-number" data-line-number="1"></td>
        <td id="LC1" class="blob-code blob-code-inner js-file-line"><span class="pl-c">#!/usr/bin/env perl</span></td>
      </tr>
      <tr>
        <td id="L2" class="blob-num js-line-number" data-line-number="2"></td>
        <td id="LC2" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L3" class="blob-num js-line-number" data-line-number="3"></td>
        <td id="LC3" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># $Id: detokenizer.perl 4134 2011-08-08 15:30:54Z bgottesman $</span></td>
      </tr>
      <tr>
        <td id="L4" class="blob-num js-line-number" data-line-number="4"></td>
        <td id="LC4" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Sample De-Tokenizer</span></td>
      </tr>
      <tr>
        <td id="L5" class="blob-num js-line-number" data-line-number="5"></td>
        <td id="LC5" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># written by Josh Schroeder, based on code by Philipp Koehn</span></td>
      </tr>
      <tr>
        <td id="L6" class="blob-num js-line-number" data-line-number="6"></td>
        <td id="LC6" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># further modifications by Ondrej Bojar</span></td>
      </tr>
      <tr>
        <td id="L7" class="blob-num js-line-number" data-line-number="7"></td>
        <td id="LC7" class="blob-code blob-code-inner js-file-line"><span class="pl-c">#</span></td>
      </tr>
      <tr>
        <td id="L8" class="blob-num js-line-number" data-line-number="8"></td>
        <td id="LC8" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># This file is part of moses.  Its use is licensed under the GNU Lesser General</span></td>
      </tr>
      <tr>
        <td id="L9" class="blob-num js-line-number" data-line-number="9"></td>
        <td id="LC9" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Public License version 2.1 or, at your option, any later version.</span></td>
      </tr>
      <tr>
        <td id="L10" class="blob-num js-line-number" data-line-number="10"></td>
        <td id="LC10" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L11" class="blob-num js-line-number" data-line-number="11"></td>
        <td id="LC11" class="blob-code blob-code-inner js-file-line"><span class="pl-c1">binmode</span>(<span class="pl-c1">STDIN</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>:utf8<span class="pl-pds">&quot;</span></span>);</td>
      </tr>
      <tr>
        <td id="L12" class="blob-num js-line-number" data-line-number="12"></td>
        <td id="LC12" class="blob-code blob-code-inner js-file-line"><span class="pl-c1">binmode</span>(<span class="pl-c1">STDOUT</span>, <span class="pl-s"><span class="pl-pds">&quot;</span>:utf8<span class="pl-pds">&quot;</span></span>);</td>
      </tr>
      <tr>
        <td id="L13" class="blob-num js-line-number" data-line-number="13"></td>
        <td id="LC13" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L14" class="blob-num js-line-number" data-line-number="14"></td>
        <td id="LC14" class="blob-code blob-code-inner js-file-line"><span class="pl-k">use</span> warnings;</td>
      </tr>
      <tr>
        <td id="L15" class="blob-num js-line-number" data-line-number="15"></td>
        <td id="LC15" class="blob-code blob-code-inner js-file-line"><span class="pl-k">use</span> strict;</td>
      </tr>
      <tr>
        <td id="L16" class="blob-num js-line-number" data-line-number="16"></td>
        <td id="LC16" class="blob-code blob-code-inner js-file-line"><span class="pl-k">use</span> utf8; <span class="pl-c"># tell perl this script file is in UTF-8 (see all funny punct below)</span></td>
      </tr>
      <tr>
        <td id="L17" class="blob-num js-line-number" data-line-number="17"></td>
        <td id="LC17" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L18" class="blob-num js-line-number" data-line-number="18"></td>
        <td id="LC18" class="blob-code blob-code-inner js-file-line"><span class="pl-k">my</span> <span class="pl-smi">$language</span> = <span class="pl-s"><span class="pl-pds">&quot;</span>en<span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L19" class="blob-num js-line-number" data-line-number="19"></td>
        <td id="LC19" class="blob-code blob-code-inner js-file-line"><span class="pl-k">my</span> <span class="pl-smi">$QUIET</span> = 0;</td>
      </tr>
      <tr>
        <td id="L20" class="blob-num js-line-number" data-line-number="20"></td>
        <td id="LC20" class="blob-code blob-code-inner js-file-line"><span class="pl-k">my</span> <span class="pl-smi">$HELP</span> = 0;</td>
      </tr>
      <tr>
        <td id="L21" class="blob-num js-line-number" data-line-number="21"></td>
        <td id="LC21" class="blob-code blob-code-inner js-file-line"><span class="pl-k">my</span> <span class="pl-smi">$UPPERCASE_SENT</span> = 0;</td>
      </tr>
      <tr>
        <td id="L22" class="blob-num js-line-number" data-line-number="22"></td>
        <td id="LC22" class="blob-code blob-code-inner js-file-line"><span class="pl-k">my</span> <span class="pl-smi">$PENN</span> = 0;</td>
      </tr>
      <tr>
        <td id="L23" class="blob-num js-line-number" data-line-number="23"></td>
        <td id="LC23" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L24" class="blob-num js-line-number" data-line-number="24"></td>
        <td id="LC24" class="blob-code blob-code-inner js-file-line"><span class="pl-k">while</span> (<span class="pl-smi">@ARGV</span>) {</td>
      </tr>
      <tr>
        <td id="L25" class="blob-num js-line-number" data-line-number="25"></td>
        <td id="LC25" class="blob-code blob-code-inner js-file-line">	<span class="pl-smi">$_</span> = <span class="pl-c1">shift</span>;</td>
      </tr>
      <tr>
        <td id="L26" class="blob-num js-line-number" data-line-number="26"></td>
        <td id="LC26" class="blob-code blob-code-inner js-file-line">	/^<span class="pl-k">-b</span><span class="pl-smi">$/</span> &amp;&amp; (<span class="pl-smi">$|</span> = 1, <span class="pl-k">next</span>);</td>
      </tr>
      <tr>
        <td id="L27" class="blob-num js-line-number" data-line-number="27"></td>
        <td id="LC27" class="blob-code blob-code-inner js-file-line">	/^<span class="pl-k">-l</span><span class="pl-smi">$/</span> &amp;&amp; (<span class="pl-smi">$language</span> = <span class="pl-c1">shift</span>, <span class="pl-k">next</span>);</td>
      </tr>
      <tr>
        <td id="L28" class="blob-num js-line-number" data-line-number="28"></td>
        <td id="LC28" class="blob-code blob-code-inner js-file-line">	/^-<span class="pl-s"><span class="pl-pds">q$</span>/ &amp;&amp; (<span class="pl-pds">$</span></span>QUIET = 1, <span class="pl-k">next</span>);</td>
      </tr>
      <tr>
        <td id="L29" class="blob-num js-line-number" data-line-number="29"></td>
        <td id="LC29" class="blob-code blob-code-inner js-file-line">	/^-h<span class="pl-smi">$/</span> &amp;&amp; (<span class="pl-smi">$HELP</span> = 1, <span class="pl-k">next</span>);</td>
      </tr>
      <tr>
        <td id="L30" class="blob-num js-line-number" data-line-number="30"></td>
        <td id="LC30" class="blob-code blob-code-inner js-file-line">	/^<span class="pl-k">-u</span><span class="pl-smi">$/</span> &amp;&amp; (<span class="pl-smi">$UPPERCASE_SENT</span> = 1, <span class="pl-k">next</span>);</td>
      </tr>
      <tr>
        <td id="L31" class="blob-num js-line-number" data-line-number="31"></td>
        <td id="LC31" class="blob-code blob-code-inner js-file-line">  /^-penn<span class="pl-smi">$/</span> &amp;&amp; (<span class="pl-smi">$PENN</span> = 1, <span class="pl-k">next</span>);</td>
      </tr>
      <tr>
        <td id="L32" class="blob-num js-line-number" data-line-number="32"></td>
        <td id="LC32" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L33" class="blob-num js-line-number" data-line-number="33"></td>
        <td id="LC33" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L34" class="blob-num js-line-number" data-line-number="34"></td>
        <td id="LC34" class="blob-code blob-code-inner js-file-line"><span class="pl-k">if</span> (<span class="pl-smi">$HELP</span>) {</td>
      </tr>
      <tr>
        <td id="L35" class="blob-num js-line-number" data-line-number="35"></td>
        <td id="LC35" class="blob-code blob-code-inner js-file-line">	<span class="pl-c1">print</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Usage ./detokenizer.perl (-l [en|fr|it|cs|...]) &lt; tokenizedfile &gt; detokenizedfile<span class="pl-cce">\n</span><span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L36" class="blob-num js-line-number" data-line-number="36"></td>
        <td id="LC36" class="blob-code blob-code-inner js-file-line">        <span class="pl-c1">print</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Options:<span class="pl-cce">\n</span><span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L37" class="blob-num js-line-number" data-line-number="37"></td>
        <td id="LC37" class="blob-code blob-code-inner js-file-line">        <span class="pl-c1">print</span> <span class="pl-s"><span class="pl-pds">&quot;</span>  -u     ... uppercase the first char in the final sentence.<span class="pl-cce">\n</span><span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L38" class="blob-num js-line-number" data-line-number="38"></td>
        <td id="LC38" class="blob-code blob-code-inner js-file-line">        <span class="pl-c1">print</span> <span class="pl-s"><span class="pl-pds">&quot;</span>  -q     ... don&#39;t report detokenizer revision.<span class="pl-cce">\n</span><span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L39" class="blob-num js-line-number" data-line-number="39"></td>
        <td id="LC39" class="blob-code blob-code-inner js-file-line">        <span class="pl-c1">print</span> <span class="pl-s"><span class="pl-pds">&quot;</span>  -b     ... disable Perl buffering.<span class="pl-cce">\n</span><span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L40" class="blob-num js-line-number" data-line-number="40"></td>
        <td id="LC40" class="blob-code blob-code-inner js-file-line">        <span class="pl-c1">print</span> <span class="pl-s"><span class="pl-pds">&quot;</span>  -penn  ... assume input is tokenized as per tokenizer.perl&#39;s -penn option.<span class="pl-cce">\n</span><span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L41" class="blob-num js-line-number" data-line-number="41"></td>
        <td id="LC41" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">exit</span>;</td>
      </tr>
      <tr>
        <td id="L42" class="blob-num js-line-number" data-line-number="42"></td>
        <td id="LC42" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L43" class="blob-num js-line-number" data-line-number="43"></td>
        <td id="LC43" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L44" class="blob-num js-line-number" data-line-number="44"></td>
        <td id="LC44" class="blob-code blob-code-inner js-file-line"><span class="pl-k">if</span> (<span class="pl-smi">$language</span> !~ <span class="pl-sr"><span class="pl-pds">/</span>^(cs|en|fr|it|fi)<span class="pl-k">$</span><span class="pl-pds">/</span></span>) {</td>
      </tr>
      <tr>
        <td id="L45" class="blob-num js-line-number" data-line-number="45"></td>
        <td id="LC45" class="blob-code blob-code-inner js-file-line">  <span class="pl-c1">print</span> <span class="pl-c1">STDERR</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Warning: No built-in rules for language <span class="pl-smi">$language</span>.<span class="pl-cce">\n</span><span class="pl-pds">&quot;</span></span></td>
      </tr>
      <tr>
        <td id="L46" class="blob-num js-line-number" data-line-number="46"></td>
        <td id="LC46" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L47" class="blob-num js-line-number" data-line-number="47"></td>
        <td id="LC47" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L48" class="blob-num js-line-number" data-line-number="48"></td>
        <td id="LC48" class="blob-code blob-code-inner js-file-line"><span class="pl-k">if</span> (<span class="pl-smi">$PENN</span> &amp;&amp; <span class="pl-smi">$language</span> <span class="pl-c1">ne</span> <span class="pl-s"><span class="pl-pds">&quot;</span>en<span class="pl-pds">&quot;</span></span>) {</td>
      </tr>
      <tr>
        <td id="L49" class="blob-num js-line-number" data-line-number="49"></td>
        <td id="LC49" class="blob-code blob-code-inner js-file-line">  <span class="pl-c1">print</span> <span class="pl-c1">STDERR</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Error: -penn option only supported for English text.<span class="pl-cce">\n</span><span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L50" class="blob-num js-line-number" data-line-number="50"></td>
        <td id="LC50" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">exit</span>;</td>
      </tr>
      <tr>
        <td id="L51" class="blob-num js-line-number" data-line-number="51"></td>
        <td id="LC51" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L52" class="blob-num js-line-number" data-line-number="52"></td>
        <td id="LC52" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L53" class="blob-num js-line-number" data-line-number="53"></td>
        <td id="LC53" class="blob-code blob-code-inner js-file-line"><span class="pl-k">if</span> (!<span class="pl-smi">$QUIET</span>) {</td>
      </tr>
      <tr>
        <td id="L54" class="blob-num js-line-number" data-line-number="54"></td>
        <td id="LC54" class="blob-code blob-code-inner js-file-line">	<span class="pl-c1">print</span> <span class="pl-c1">STDERR</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Detokenizer Version <span class="pl-pds">&quot;</span></span>.<span class="pl-s"><span class="pl-pds">&#39;</span>$Revision: 4134 $<span class="pl-pds">&#39;</span></span>.<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-cce">\n</span><span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L55" class="blob-num js-line-number" data-line-number="55"></td>
        <td id="LC55" class="blob-code blob-code-inner js-file-line">	<span class="pl-c1">print</span> <span class="pl-c1">STDERR</span> <span class="pl-s"><span class="pl-pds">&quot;</span>Language: <span class="pl-smi">$language</span><span class="pl-cce">\n</span><span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L56" class="blob-num js-line-number" data-line-number="56"></td>
        <td id="LC56" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L57" class="blob-num js-line-number" data-line-number="57"></td>
        <td id="LC57" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L58" class="blob-num js-line-number" data-line-number="58"></td>
        <td id="LC58" class="blob-code blob-code-inner js-file-line"><span class="pl-k">while</span>(&lt;<span class="pl-c1">STDIN</span>&gt;) {</td>
      </tr>
      <tr>
        <td id="L59" class="blob-num js-line-number" data-line-number="59"></td>
        <td id="LC59" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">if</span> (<span class="pl-sr"><span class="pl-pds">/</span>^&lt;.+&gt;<span class="pl-k">$</span><span class="pl-pds">/</span></span> || /^\<span class="pl-c1">s</span>*<span class="pl-smi">$/</span>) {</td>
      </tr>
      <tr>
        <td id="L60" class="blob-num js-line-number" data-line-number="60"></td>
        <td id="LC60" class="blob-code blob-code-inner js-file-line">		<span class="pl-c">#don&#39;t try to detokenize XML/HTML tag lines</span></td>
      </tr>
      <tr>
        <td id="L61" class="blob-num js-line-number" data-line-number="61"></td>
        <td id="LC61" class="blob-code blob-code-inner js-file-line">		<span class="pl-c1">print</span> <span class="pl-smi">$_</span>;</td>
      </tr>
      <tr>
        <td id="L62" class="blob-num js-line-number" data-line-number="62"></td>
        <td id="LC62" class="blob-code blob-code-inner js-file-line">  } <span class="pl-k">elsif</span> (<span class="pl-smi">$PENN</span>) {</td>
      </tr>
      <tr>
        <td id="L63" class="blob-num js-line-number" data-line-number="63"></td>
        <td id="LC63" class="blob-code blob-code-inner js-file-line">    <span class="pl-c1">print</span> &amp;detokenize_penn(<span class="pl-smi">$_</span>);</td>
      </tr>
      <tr>
        <td id="L64" class="blob-num js-line-number" data-line-number="64"></td>
        <td id="LC64" class="blob-code blob-code-inner js-file-line">  } <span class="pl-k">else</span> {</td>
      </tr>
      <tr>
        <td id="L65" class="blob-num js-line-number" data-line-number="65"></td>
        <td id="LC65" class="blob-code blob-code-inner js-file-line">		<span class="pl-c1">print</span> &amp;detokenize(<span class="pl-smi">$_</span>);</td>
      </tr>
      <tr>
        <td id="L66" class="blob-num js-line-number" data-line-number="66"></td>
        <td id="LC66" class="blob-code blob-code-inner js-file-line">	}</td>
      </tr>
      <tr>
        <td id="L67" class="blob-num js-line-number" data-line-number="67"></td>
        <td id="LC67" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L68" class="blob-num js-line-number" data-line-number="68"></td>
        <td id="LC68" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L69" class="blob-num js-line-number" data-line-number="69"></td>
        <td id="LC69" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L70" class="blob-num js-line-number" data-line-number="70"></td>
        <td id="LC70" class="blob-code blob-code-inner js-file-line"><span class="pl-k">sub</span> <span class="pl-en">ucsecondarg</span> {</td>
      </tr>
      <tr>
        <td id="L71" class="blob-num js-line-number" data-line-number="71"></td>
        <td id="LC71" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># uppercase the second argument</span></td>
      </tr>
      <tr>
        <td id="L72" class="blob-num js-line-number" data-line-number="72"></td>
        <td id="LC72" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">my</span> <span class="pl-smi">$arg1</span> = <span class="pl-c1">shift</span>;</td>
      </tr>
      <tr>
        <td id="L73" class="blob-num js-line-number" data-line-number="73"></td>
        <td id="LC73" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">my</span> <span class="pl-smi">$arg2</span> = <span class="pl-c1">shift</span>;</td>
      </tr>
      <tr>
        <td id="L74" class="blob-num js-line-number" data-line-number="74"></td>
        <td id="LC74" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">return</span> <span class="pl-smi">$arg1</span>.<span class="pl-c1">uc</span>(<span class="pl-smi">$arg2</span>);</td>
      </tr>
      <tr>
        <td id="L75" class="blob-num js-line-number" data-line-number="75"></td>
        <td id="LC75" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L76" class="blob-num js-line-number" data-line-number="76"></td>
        <td id="LC76" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L77" class="blob-num js-line-number" data-line-number="77"></td>
        <td id="LC77" class="blob-code blob-code-inner js-file-line"><span class="pl-k">sub</span> <span class="pl-en">deescape</span> {</td>
      </tr>
      <tr>
        <td id="L78" class="blob-num js-line-number" data-line-number="78"></td>
        <td id="LC78" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># de-escape special chars</span></td>
      </tr>
      <tr>
        <td id="L79" class="blob-num js-line-number" data-line-number="79"></td>
        <td id="LC79" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">my</span> (<span class="pl-smi">$text</span>) = <span class="pl-smi">@_</span>;</td>
      </tr>
      <tr>
        <td id="L80" class="blob-num js-line-number" data-line-number="80"></td>
        <td id="LC80" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span><span class="pl-cce">\&amp;</span>bar;</span><span class="pl-sr"><span class="pl-pds">/</span><span class="pl-cce">\|</span><span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;   <span class="pl-c"># factor separator (legacy)</span></td>
      </tr>
      <tr>
        <td id="L81" class="blob-num js-line-number" data-line-number="81"></td>
        <td id="LC81" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span><span class="pl-cce">\&amp;</span>#124;</span><span class="pl-sr"><span class="pl-pds">/</span><span class="pl-cce">\|</span><span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;  <span class="pl-c"># factor separator</span></td>
      </tr>
      <tr>
        <td id="L82" class="blob-num js-line-number" data-line-number="82"></td>
        <td id="LC82" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span><span class="pl-cce">\&amp;</span>lt;</span><span class="pl-sr"><span class="pl-pds">/</span><span class="pl-cce">\&lt;</span><span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;    <span class="pl-c"># xml</span></td>
      </tr>
      <tr>
        <td id="L83" class="blob-num js-line-number" data-line-number="83"></td>
        <td id="LC83" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span><span class="pl-cce">\&amp;</span>gt;</span><span class="pl-sr"><span class="pl-pds">/</span><span class="pl-cce">\&gt;</span><span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;    <span class="pl-c"># xml</span></td>
      </tr>
      <tr>
        <td id="L84" class="blob-num js-line-number" data-line-number="84"></td>
        <td id="LC84" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span><span class="pl-cce">\&amp;</span>bra;</span><span class="pl-sr"><span class="pl-pds">/</span><span class="pl-cce">\[</span><span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;   <span class="pl-c"># syntax non-terminal (legacy)</span></td>
      </tr>
      <tr>
        <td id="L85" class="blob-num js-line-number" data-line-number="85"></td>
        <td id="LC85" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span><span class="pl-cce">\&amp;</span>ket;</span><span class="pl-sr"><span class="pl-pds">/</span><span class="pl-cce">\]</span><span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;   <span class="pl-c"># syntax non-terminal (legacy)</span></td>
      </tr>
      <tr>
        <td id="L86" class="blob-num js-line-number" data-line-number="86"></td>
        <td id="LC86" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span><span class="pl-cce">\&amp;</span>quot;</span><span class="pl-sr"><span class="pl-pds">/</span><span class="pl-cce">\&quot;</span><span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;  <span class="pl-c"># xml</span></td>
      </tr>
      <tr>
        <td id="L87" class="blob-num js-line-number" data-line-number="87"></td>
        <td id="LC87" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span><span class="pl-cce">\&amp;</span>apos;</span><span class="pl-sr"><span class="pl-pds">/</span><span class="pl-cce">\&#39;</span><span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;  <span class="pl-c"># xml</span></td>
      </tr>
      <tr>
        <td id="L88" class="blob-num js-line-number" data-line-number="88"></td>
        <td id="LC88" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span><span class="pl-cce">\&amp;</span>#91;</span><span class="pl-sr"><span class="pl-pds">/</span><span class="pl-cce">\[</span><span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;   <span class="pl-c"># syntax non-terminal</span></td>
      </tr>
      <tr>
        <td id="L89" class="blob-num js-line-number" data-line-number="89"></td>
        <td id="LC89" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span><span class="pl-cce">\&amp;</span>#93;</span><span class="pl-sr"><span class="pl-pds">/</span><span class="pl-cce">\]</span><span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;   <span class="pl-c"># syntax non-terminal</span></td>
      </tr>
      <tr>
        <td id="L90" class="blob-num js-line-number" data-line-number="90"></td>
        <td id="LC90" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span><span class="pl-cce">\&amp;</span>amp;</span><span class="pl-sr"><span class="pl-pds">/</span><span class="pl-cce">\&amp;</span><span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;   <span class="pl-c"># escape escape</span></td>
      </tr>
      <tr>
        <td id="L91" class="blob-num js-line-number" data-line-number="91"></td>
        <td id="LC91" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">return</span> <span class="pl-smi">$text</span>;</td>
      </tr>
      <tr>
        <td id="L92" class="blob-num js-line-number" data-line-number="92"></td>
        <td id="LC92" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L93" class="blob-num js-line-number" data-line-number="93"></td>
        <td id="LC93" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L94" class="blob-num js-line-number" data-line-number="94"></td>
        <td id="LC94" class="blob-code blob-code-inner js-file-line"><span class="pl-k">sub</span> <span class="pl-en">detokenize</span> {</td>
      </tr>
      <tr>
        <td id="L95" class="blob-num js-line-number" data-line-number="95"></td>
        <td id="LC95" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">my</span>(<span class="pl-smi">$text</span>) = <span class="pl-smi">@_</span>;</td>
      </tr>
      <tr>
        <td id="L96" class="blob-num js-line-number" data-line-number="96"></td>
        <td id="LC96" class="blob-code blob-code-inner js-file-line">	<span class="pl-c1">chomp</span>(<span class="pl-smi">$text</span>);</td>
      </tr>
      <tr>
        <td id="L97" class="blob-num js-line-number" data-line-number="97"></td>
        <td id="LC97" class="blob-code blob-code-inner js-file-line">	<span class="pl-smi">$text</span> = <span class="pl-s"><span class="pl-pds">&quot;</span> <span class="pl-smi">$text</span> <span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L98" class="blob-num js-line-number" data-line-number="98"></td>
        <td id="LC98" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span> <span class="pl-cce">\@\-\@</span> </span><span class="pl-sr"><span class="pl-pds">/</span>-<span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;</td>
      </tr>
      <tr>
        <td id="L99" class="blob-num js-line-number" data-line-number="99"></td>
        <td id="LC99" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> = &amp;deescape(<span class="pl-smi">$text</span>);</td>
      </tr>
      <tr>
        <td id="L100" class="blob-num js-line-number" data-line-number="100"></td>
        <td id="LC100" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L101" class="blob-num js-line-number" data-line-number="101"></td>
        <td id="LC101" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">my</span> <span class="pl-smi">$word</span>;</td>
      </tr>
      <tr>
        <td id="L102" class="blob-num js-line-number" data-line-number="102"></td>
        <td id="LC102" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">my</span> <span class="pl-smi">$i</span>;</td>
      </tr>
      <tr>
        <td id="L103" class="blob-num js-line-number" data-line-number="103"></td>
        <td id="LC103" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">my</span> <span class="pl-smi">@words</span> = <span class="pl-c1">split</span>(<span class="pl-sr"><span class="pl-pds">/</span> <span class="pl-pds">/</span></span>,<span class="pl-smi">$text</span>);</td>
      </tr>
      <tr>
        <td id="L104" class="blob-num js-line-number" data-line-number="104"></td>
        <td id="LC104" class="blob-code blob-code-inner js-file-line">	<span class="pl-smi">$text</span> = <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L105" class="blob-num js-line-number" data-line-number="105"></td>
        <td id="LC105" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">my</span> <span class="pl-smi">%quoteCount</span> =  (<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-cce">\&#39;</span><span class="pl-pds">&quot;</span></span><span class="pl-k">=&gt;</span>0,<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-cce">\&quot;</span><span class="pl-pds">&quot;</span></span><span class="pl-k">=&gt;</span>0);</td>
      </tr>
      <tr>
        <td id="L106" class="blob-num js-line-number" data-line-number="106"></td>
        <td id="LC106" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">my</span> <span class="pl-smi">$prependSpace</span> = <span class="pl-s"><span class="pl-pds">&quot;</span> <span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L107" class="blob-num js-line-number" data-line-number="107"></td>
        <td id="LC107" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">for</span> (<span class="pl-smi">$i</span>=0;<span class="pl-smi">$i</span>&lt;(<span class="pl-c1">scalar</span>(<span class="pl-smi">@words</span>));<span class="pl-smi">$i</span>++) {		</td>
      </tr>
      <tr>
        <td id="L108" class="blob-num js-line-number" data-line-number="108"></td>
        <td id="LC108" class="blob-code blob-code-inner js-file-line">		<span class="pl-k">if</span> (&amp;startsWithCJKChar(<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>])) {</td>
      </tr>
      <tr>
        <td id="L109" class="blob-num js-line-number" data-line-number="109"></td>
        <td id="LC109" class="blob-code blob-code-inner js-file-line">		    <span class="pl-k">if</span> (<span class="pl-smi">$i</span> &gt; 0 &amp;&amp; &amp;endsWithCJKChar(<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>-1])) {</td>
      </tr>
      <tr>
        <td id="L110" class="blob-num js-line-number" data-line-number="110"></td>
        <td id="LC110" class="blob-code blob-code-inner js-file-line">			<span class="pl-c"># perform left shift if this is a second consecutive CJK (Chinese/Japanese/Korean) word</span></td>
      </tr>
      <tr>
        <td id="L111" class="blob-num js-line-number" data-line-number="111"></td>
        <td id="LC111" class="blob-code blob-code-inner js-file-line">			<span class="pl-smi">$text</span>=<span class="pl-smi">$text</span>.<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>];</td>
      </tr>
      <tr>
        <td id="L112" class="blob-num js-line-number" data-line-number="112"></td>
        <td id="LC112" class="blob-code blob-code-inner js-file-line">		    } <span class="pl-k">else</span> {</td>
      </tr>
      <tr>
        <td id="L113" class="blob-num js-line-number" data-line-number="113"></td>
        <td id="LC113" class="blob-code blob-code-inner js-file-line">			<span class="pl-c"># ... but do nothing special if this is a CJK word that doesn&#39;t follow a CJK word</span></td>
      </tr>
      <tr>
        <td id="L114" class="blob-num js-line-number" data-line-number="114"></td>
        <td id="LC114" class="blob-code blob-code-inner js-file-line">			<span class="pl-smi">$text</span>=<span class="pl-smi">$text</span>.<span class="pl-smi">$prependSpace</span>.<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>];</td>
      </tr>
      <tr>
        <td id="L115" class="blob-num js-line-number" data-line-number="115"></td>
        <td id="LC115" class="blob-code blob-code-inner js-file-line">		    }</td>
      </tr>
      <tr>
        <td id="L116" class="blob-num js-line-number" data-line-number="116"></td>
        <td id="LC116" class="blob-code blob-code-inner js-file-line">		    <span class="pl-smi">$prependSpace</span> = <span class="pl-s"><span class="pl-pds">&quot;</span> <span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L117" class="blob-num js-line-number" data-line-number="117"></td>
        <td id="LC117" class="blob-code blob-code-inner js-file-line">		} <span class="pl-k">elsif</span> (<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>] =~ <span class="pl-sr"><span class="pl-pds">/</span>^[<span class="pl-cce">\p{IsSc}\(\[\{\¿\¡</span>]+<span class="pl-k">$</span><span class="pl-pds">/</span></span>) {</td>
      </tr>
      <tr>
        <td id="L118" class="blob-num js-line-number" data-line-number="118"></td>
        <td id="LC118" class="blob-code blob-code-inner js-file-line">			<span class="pl-c">#perform right shift on currency and other random punctuation items</span></td>
      </tr>
      <tr>
        <td id="L119" class="blob-num js-line-number" data-line-number="119"></td>
        <td id="LC119" class="blob-code blob-code-inner js-file-line">			<span class="pl-smi">$text</span> = <span class="pl-smi">$text</span>.<span class="pl-smi">$prependSpace</span>.<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>];</td>
      </tr>
      <tr>
        <td id="L120" class="blob-num js-line-number" data-line-number="120"></td>
        <td id="LC120" class="blob-code blob-code-inner js-file-line">			<span class="pl-smi">$prependSpace</span> = <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L121" class="blob-num js-line-number" data-line-number="121"></td>
        <td id="LC121" class="blob-code blob-code-inner js-file-line">		} <span class="pl-k">elsif</span> (<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>] =~ <span class="pl-sr"><span class="pl-pds">/</span>^[<span class="pl-cce">\,\.\?\!\:\;\\\%\}\]\)</span>]+<span class="pl-k">$</span><span class="pl-pds">/</span></span>){</td>
      </tr>
      <tr>
        <td id="L122" class="blob-num js-line-number" data-line-number="122"></td>
        <td id="LC122" class="blob-code blob-code-inner js-file-line">		    <span class="pl-k">if</span> ((<span class="pl-smi">$language</span> <span class="pl-c1">eq</span> <span class="pl-s"><span class="pl-pds">&quot;</span>fr<span class="pl-pds">&quot;</span></span>) &amp;&amp; (<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>] =~ <span class="pl-sr"><span class="pl-pds">/</span>^[<span class="pl-cce">\?\!\:\;\\\%</span>]<span class="pl-k">$</span><span class="pl-pds">/</span></span>)) {</td>
      </tr>
      <tr>
        <td id="L123" class="blob-num js-line-number" data-line-number="123"></td>
        <td id="LC123" class="blob-code blob-code-inner js-file-line">			<span class="pl-c">#these punctuations are prefixed with a non-breakable space in french</span></td>
      </tr>
      <tr>
        <td id="L124" class="blob-num js-line-number" data-line-number="124"></td>
        <td id="LC124" class="blob-code blob-code-inner js-file-line">			<span class="pl-smi">$text</span> .= <span class="pl-s"><span class="pl-pds">&quot;</span> <span class="pl-pds">&quot;</span></span>; }</td>
      </tr>
      <tr>
        <td id="L125" class="blob-num js-line-number" data-line-number="125"></td>
        <td id="LC125" class="blob-code blob-code-inner js-file-line">			<span class="pl-c">#perform left shift on punctuation items</span></td>
      </tr>
      <tr>
        <td id="L126" class="blob-num js-line-number" data-line-number="126"></td>
        <td id="LC126" class="blob-code blob-code-inner js-file-line">			<span class="pl-smi">$text</span>=<span class="pl-smi">$text</span>.<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>];</td>
      </tr>
      <tr>
        <td id="L127" class="blob-num js-line-number" data-line-number="127"></td>
        <td id="LC127" class="blob-code blob-code-inner js-file-line">			<span class="pl-smi">$prependSpace</span> = <span class="pl-s"><span class="pl-pds">&quot;</span> <span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L128" class="blob-num js-line-number" data-line-number="128"></td>
        <td id="LC128" class="blob-code blob-code-inner js-file-line">		} <span class="pl-k">elsif</span> ((<span class="pl-smi">$language</span> <span class="pl-c1">eq</span> <span class="pl-s"><span class="pl-pds">&quot;</span>en<span class="pl-pds">&quot;</span></span>) &amp;&amp; (<span class="pl-smi">$i</span>&gt;0) &amp;&amp; (<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>] =~ <span class="pl-sr"><span class="pl-pds">/</span>^[<span class="pl-cce">\&#39;</span>][<span class="pl-cce">\p{IsAlpha}</span>]<span class="pl-pds">/</span></span>) &amp;&amp; (<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>-1] =~ <span class="pl-sr"><span class="pl-pds">/</span>[<span class="pl-cce">\p{IsAlnum}</span>]<span class="pl-k">$</span><span class="pl-pds">/</span></span>)) {</td>
      </tr>
      <tr>
        <td id="L129" class="blob-num js-line-number" data-line-number="129"></td>
        <td id="LC129" class="blob-code blob-code-inner js-file-line">			<span class="pl-c">#left-shift the contraction for English</span></td>
      </tr>
      <tr>
        <td id="L130" class="blob-num js-line-number" data-line-number="130"></td>
        <td id="LC130" class="blob-code blob-code-inner js-file-line">			<span class="pl-smi">$text</span>=<span class="pl-smi">$text</span>.<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>];</td>
      </tr>
      <tr>
        <td id="L131" class="blob-num js-line-number" data-line-number="131"></td>
        <td id="LC131" class="blob-code blob-code-inner js-file-line">			<span class="pl-smi">$prependSpace</span> = <span class="pl-s"><span class="pl-pds">&quot;</span> <span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L132" class="blob-num js-line-number" data-line-number="132"></td>
        <td id="LC132" class="blob-code blob-code-inner js-file-line">		} <span class="pl-k">elsif</span> ((<span class="pl-smi">$language</span> <span class="pl-c1">eq</span> <span class="pl-s"><span class="pl-pds">&quot;</span>cs<span class="pl-pds">&quot;</span></span>) &amp;&amp; (<span class="pl-smi">$i</span>&gt;1) &amp;&amp; (<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>-2] =~ <span class="pl-sr"><span class="pl-pds">/</span>^[0-9]+<span class="pl-k">$</span><span class="pl-pds">/</span></span>) &amp;&amp; (<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>-1] =~ <span class="pl-sr"><span class="pl-pds">/</span>^[.,]<span class="pl-k">$</span><span class="pl-pds">/</span></span>) &amp;&amp; (<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>] =~ <span class="pl-sr"><span class="pl-pds">/</span>^[0-9]+<span class="pl-k">$</span><span class="pl-pds">/</span></span>)) {</td>
      </tr>
      <tr>
        <td id="L133" class="blob-num js-line-number" data-line-number="133"></td>
        <td id="LC133" class="blob-code blob-code-inner js-file-line">			<span class="pl-c">#left-shift floats in Czech</span></td>
      </tr>
      <tr>
        <td id="L134" class="blob-num js-line-number" data-line-number="134"></td>
        <td id="LC134" class="blob-code blob-code-inner js-file-line">			<span class="pl-smi">$text</span>=<span class="pl-smi">$text</span>.<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>];</td>
      </tr>
      <tr>
        <td id="L135" class="blob-num js-line-number" data-line-number="135"></td>
        <td id="LC135" class="blob-code blob-code-inner js-file-line">			<span class="pl-smi">$prependSpace</span> = <span class="pl-s"><span class="pl-pds">&quot;</span> <span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L136" class="blob-num js-line-number" data-line-number="136"></td>
        <td id="LC136" class="blob-code blob-code-inner js-file-line">		}  <span class="pl-k">elsif</span> (((<span class="pl-smi">$language</span> <span class="pl-c1">eq</span> <span class="pl-s"><span class="pl-pds">&quot;</span>fr<span class="pl-pds">&quot;</span></span>) ||(<span class="pl-smi">$language</span> <span class="pl-c1">eq</span> <span class="pl-s"><span class="pl-pds">&quot;</span>it<span class="pl-pds">&quot;</span></span>)) &amp;&amp; (<span class="pl-smi">$i</span>&lt;=(<span class="pl-c1">scalar</span>(<span class="pl-smi">@words</span>)-2)) &amp;&amp; (<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>] =~ <span class="pl-sr"><span class="pl-pds">/</span>[<span class="pl-cce">\p{IsAlpha}</span>][<span class="pl-cce">\&#39;</span>]<span class="pl-k">$</span><span class="pl-pds">/</span></span>) &amp;&amp; (<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>+1] =~ <span class="pl-sr"><span class="pl-pds">/</span>^[<span class="pl-cce">\p{IsAlpha}</span>]<span class="pl-pds">/</span></span>)) {</td>
      </tr>
      <tr>
        <td id="L137" class="blob-num js-line-number" data-line-number="137"></td>
        <td id="LC137" class="blob-code blob-code-inner js-file-line">			<span class="pl-c">#right-shift the contraction for French and Italian</span></td>
      </tr>
      <tr>
        <td id="L138" class="blob-num js-line-number" data-line-number="138"></td>
        <td id="LC138" class="blob-code blob-code-inner js-file-line">			<span class="pl-smi">$text</span> = <span class="pl-smi">$text</span>.<span class="pl-smi">$prependSpace</span>.<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>];</td>
      </tr>
      <tr>
        <td id="L139" class="blob-num js-line-number" data-line-number="139"></td>
        <td id="LC139" class="blob-code blob-code-inner js-file-line">			<span class="pl-smi">$prependSpace</span> = <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L140" class="blob-num js-line-number" data-line-number="140"></td>
        <td id="LC140" class="blob-code blob-code-inner js-file-line">		} <span class="pl-k">elsif</span> ((<span class="pl-smi">$language</span> <span class="pl-c1">eq</span> <span class="pl-s"><span class="pl-pds">&quot;</span>cs<span class="pl-pds">&quot;</span></span>) &amp;&amp; (<span class="pl-smi">$i</span>&lt;(<span class="pl-c1">scalar</span>(<span class="pl-smi">@words</span>)-3))</td>
      </tr>
      <tr>
        <td id="L141" class="blob-num js-line-number" data-line-number="141"></td>
        <td id="LC141" class="blob-code blob-code-inner js-file-line">				&amp;&amp; (<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>] =~ <span class="pl-sr"><span class="pl-pds">/</span>[<span class="pl-cce">\p{IsAlpha}</span>]<span class="pl-k">$</span><span class="pl-pds">/</span></span>)</td>
      </tr>
      <tr>
        <td id="L142" class="blob-num js-line-number" data-line-number="142"></td>
        <td id="LC142" class="blob-code blob-code-inner js-file-line">				&amp;&amp; (<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>+1] =~ <span class="pl-sr"><span class="pl-pds">/</span>^[-–]<span class="pl-k">$</span><span class="pl-pds">/</span></span>)</td>
      </tr>
      <tr>
        <td id="L143" class="blob-num js-line-number" data-line-number="143"></td>
        <td id="LC143" class="blob-code blob-code-inner js-file-line">				&amp;&amp; (<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>+2] =~ <span class="pl-sr"><span class="pl-pds">/</span>^li<span class="pl-smi">$|</span>^mail.*<span class="pl-pds">/<span class="pl-k">i</span></span></span>)</td>
      </tr>
      <tr>
        <td id="L144" class="blob-num js-line-number" data-line-number="144"></td>
        <td id="LC144" class="blob-code blob-code-inner js-file-line">				) {</td>
      </tr>
      <tr>
        <td id="L145" class="blob-num js-line-number" data-line-number="145"></td>
        <td id="LC145" class="blob-code blob-code-inner js-file-line">			<span class="pl-c">#right-shift &quot;-li&quot; in Czech and a few Czech dashed words (e-mail)</span></td>
      </tr>
      <tr>
        <td id="L146" class="blob-num js-line-number" data-line-number="146"></td>
        <td id="LC146" class="blob-code blob-code-inner js-file-line">			<span class="pl-smi">$text</span> = <span class="pl-smi">$text</span>.<span class="pl-smi">$prependSpace</span>.<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>].<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>+1];</td>
      </tr>
      <tr>
        <td id="L147" class="blob-num js-line-number" data-line-number="147"></td>
        <td id="LC147" class="blob-code blob-code-inner js-file-line">			<span class="pl-smi">$i</span>++; <span class="pl-c"># advance over the dash</span></td>
      </tr>
      <tr>
        <td id="L148" class="blob-num js-line-number" data-line-number="148"></td>
        <td id="LC148" class="blob-code blob-code-inner js-file-line">			<span class="pl-smi">$prependSpace</span> = <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L149" class="blob-num js-line-number" data-line-number="149"></td>
        <td id="LC149" class="blob-code blob-code-inner js-file-line">		} <span class="pl-k">elsif</span> (<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>] =~ <span class="pl-sr"><span class="pl-pds">/</span>^[<span class="pl-cce">\&#39;\&quot;</span>„“`]+<span class="pl-k">$</span><span class="pl-pds">/</span></span>) {</td>
      </tr>
      <tr>
        <td id="L150" class="blob-num js-line-number" data-line-number="150"></td>
        <td id="LC150" class="blob-code blob-code-inner js-file-line">			<span class="pl-c">#combine punctuation smartly</span></td>
      </tr>
      <tr>
        <td id="L151" class="blob-num js-line-number" data-line-number="151"></td>
        <td id="LC151" class="blob-code blob-code-inner js-file-line">                        <span class="pl-k">my</span> <span class="pl-smi">$normalized_quo</span> = <span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>];</td>
      </tr>
      <tr>
        <td id="L152" class="blob-num js-line-number" data-line-number="152"></td>
        <td id="LC152" class="blob-code blob-code-inner js-file-line">                        <span class="pl-smi">$normalized_quo</span> = <span class="pl-s"><span class="pl-pds">&#39;</span>&quot;<span class="pl-pds">&#39;</span></span> <span class="pl-k">if</span> <span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>] =~ <span class="pl-sr"><span class="pl-pds">/</span>^[„“”]+<span class="pl-k">$</span><span class="pl-pds">/</span></span>;</td>
      </tr>
      <tr>
        <td id="L153" class="blob-num js-line-number" data-line-number="153"></td>
        <td id="LC153" class="blob-code blob-code-inner js-file-line">                        <span class="pl-smi">$quoteCount</span>{<span class="pl-smi">$normalized_quo</span>} = 0</td>
      </tr>
      <tr>
        <td id="L154" class="blob-num js-line-number" data-line-number="154"></td>
        <td id="LC154" class="blob-code blob-code-inner js-file-line">                                <span class="pl-k">if</span> !<span class="pl-c1">defined</span> <span class="pl-smi">$quoteCount</span>{<span class="pl-smi">$normalized_quo</span>};</td>
      </tr>
      <tr>
        <td id="L155" class="blob-num js-line-number" data-line-number="155"></td>
        <td id="LC155" class="blob-code blob-code-inner js-file-line">                        <span class="pl-k">if</span> (<span class="pl-smi">$language</span> <span class="pl-c1">eq</span> <span class="pl-s"><span class="pl-pds">&quot;</span>cs<span class="pl-pds">&quot;</span></span> &amp;&amp; <span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>] <span class="pl-c1">eq</span> <span class="pl-s"><span class="pl-pds">&quot;</span>„<span class="pl-pds">&quot;</span></span>) {</td>
      </tr>
      <tr>
        <td id="L156" class="blob-num js-line-number" data-line-number="156"></td>
        <td id="LC156" class="blob-code blob-code-inner js-file-line">                          <span class="pl-c"># this is always the starting quote in Czech</span></td>
      </tr>
      <tr>
        <td id="L157" class="blob-num js-line-number" data-line-number="157"></td>
        <td id="LC157" class="blob-code blob-code-inner js-file-line">                          <span class="pl-smi">$quoteCount</span>{<span class="pl-smi">$normalized_quo</span>} = 0;</td>
      </tr>
      <tr>
        <td id="L158" class="blob-num js-line-number" data-line-number="158"></td>
        <td id="LC158" class="blob-code blob-code-inner js-file-line">                        }</td>
      </tr>
      <tr>
        <td id="L159" class="blob-num js-line-number" data-line-number="159"></td>
        <td id="LC159" class="blob-code blob-code-inner js-file-line">                        <span class="pl-k">if</span> (<span class="pl-smi">$language</span> <span class="pl-c1">eq</span> <span class="pl-s"><span class="pl-pds">&quot;</span>cs<span class="pl-pds">&quot;</span></span> &amp;&amp; <span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>] <span class="pl-c1">eq</span> <span class="pl-s"><span class="pl-pds">&quot;</span>“<span class="pl-pds">&quot;</span></span>) {</td>
      </tr>
      <tr>
        <td id="L160" class="blob-num js-line-number" data-line-number="160"></td>
        <td id="LC160" class="blob-code blob-code-inner js-file-line">                          <span class="pl-c"># this is usually the ending quote in Czech</span></td>
      </tr>
      <tr>
        <td id="L161" class="blob-num js-line-number" data-line-number="161"></td>
        <td id="LC161" class="blob-code blob-code-inner js-file-line">                          <span class="pl-smi">$quoteCount</span>{<span class="pl-smi">$normalized_quo</span>} = 1;</td>
      </tr>
      <tr>
        <td id="L162" class="blob-num js-line-number" data-line-number="162"></td>
        <td id="LC162" class="blob-code blob-code-inner js-file-line">                        }</td>
      </tr>
      <tr>
        <td id="L163" class="blob-num js-line-number" data-line-number="163"></td>
        <td id="LC163" class="blob-code blob-code-inner js-file-line">			<span class="pl-k">if</span> ((<span class="pl-smi">$quoteCount</span>{<span class="pl-smi">$normalized_quo</span>} % 2) <span class="pl-c1">eq</span> 0) {</td>
      </tr>
      <tr>
        <td id="L164" class="blob-num js-line-number" data-line-number="164"></td>
        <td id="LC164" class="blob-code blob-code-inner js-file-line">				<span class="pl-k">if</span>((<span class="pl-smi">$language</span> <span class="pl-c1">eq</span> <span class="pl-s"><span class="pl-pds">&quot;</span>en<span class="pl-pds">&quot;</span></span>) &amp;&amp; (<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>] <span class="pl-c1">eq</span> <span class="pl-s"><span class="pl-pds">&quot;</span>&#39;<span class="pl-pds">&quot;</span></span>) &amp;&amp; (<span class="pl-smi">$i</span> &gt; 0) &amp;&amp; (<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>-1] =~ <span class="pl-sr"><span class="pl-pds">/</span>[s]<span class="pl-k">$</span><span class="pl-pds">/</span></span>)) {</td>
      </tr>
      <tr>
        <td id="L165" class="blob-num js-line-number" data-line-number="165"></td>
        <td id="LC165" class="blob-code blob-code-inner js-file-line">					<span class="pl-c">#single quote for posesssives ending in s... &quot;The Jones&#39; house&quot;</span></td>
      </tr>
      <tr>
        <td id="L166" class="blob-num js-line-number" data-line-number="166"></td>
        <td id="LC166" class="blob-code blob-code-inner js-file-line">					<span class="pl-c">#left shift</span></td>
      </tr>
      <tr>
        <td id="L167" class="blob-num js-line-number" data-line-number="167"></td>
        <td id="LC167" class="blob-code blob-code-inner js-file-line">					<span class="pl-smi">$text</span>=<span class="pl-smi">$text</span>.<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>];</td>
      </tr>
      <tr>
        <td id="L168" class="blob-num js-line-number" data-line-number="168"></td>
        <td id="LC168" class="blob-code blob-code-inner js-file-line">					<span class="pl-smi">$prependSpace</span> = <span class="pl-s"><span class="pl-pds">&quot;</span> <span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L169" class="blob-num js-line-number" data-line-number="169"></td>
        <td id="LC169" class="blob-code blob-code-inner js-file-line">				} <span class="pl-k">else</span> {</td>
      </tr>
      <tr>
        <td id="L170" class="blob-num js-line-number" data-line-number="170"></td>
        <td id="LC170" class="blob-code blob-code-inner js-file-line">					<span class="pl-c">#right shift</span></td>
      </tr>
      <tr>
        <td id="L171" class="blob-num js-line-number" data-line-number="171"></td>
        <td id="LC171" class="blob-code blob-code-inner js-file-line">					<span class="pl-smi">$text</span> = <span class="pl-smi">$text</span>.<span class="pl-smi">$prependSpace</span>.<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>];</td>
      </tr>
      <tr>
        <td id="L172" class="blob-num js-line-number" data-line-number="172"></td>
        <td id="LC172" class="blob-code blob-code-inner js-file-line">					<span class="pl-smi">$prependSpace</span> = <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L173" class="blob-num js-line-number" data-line-number="173"></td>
        <td id="LC173" class="blob-code blob-code-inner js-file-line">					<span class="pl-smi">$quoteCount</span>{<span class="pl-smi">$normalized_quo</span>} ++;</td>
      </tr>
      <tr>
        <td id="L174" class="blob-num js-line-number" data-line-number="174"></td>
        <td id="LC174" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L175" class="blob-num js-line-number" data-line-number="175"></td>
        <td id="LC175" class="blob-code blob-code-inner js-file-line">				}</td>
      </tr>
      <tr>
        <td id="L176" class="blob-num js-line-number" data-line-number="176"></td>
        <td id="LC176" class="blob-code blob-code-inner js-file-line">			} <span class="pl-k">else</span> {</td>
      </tr>
      <tr>
        <td id="L177" class="blob-num js-line-number" data-line-number="177"></td>
        <td id="LC177" class="blob-code blob-code-inner js-file-line">				<span class="pl-c">#left shift</span></td>
      </tr>
      <tr>
        <td id="L178" class="blob-num js-line-number" data-line-number="178"></td>
        <td id="LC178" class="blob-code blob-code-inner js-file-line">				<span class="pl-smi">$text</span>=<span class="pl-smi">$text</span>.<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>];</td>
      </tr>
      <tr>
        <td id="L179" class="blob-num js-line-number" data-line-number="179"></td>
        <td id="LC179" class="blob-code blob-code-inner js-file-line">				<span class="pl-smi">$prependSpace</span> = <span class="pl-s"><span class="pl-pds">&quot;</span> <span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L180" class="blob-num js-line-number" data-line-number="180"></td>
        <td id="LC180" class="blob-code blob-code-inner js-file-line">				<span class="pl-smi">$quoteCount</span>{<span class="pl-smi">$normalized_quo</span>} ++;</td>
      </tr>
      <tr>
        <td id="L181" class="blob-num js-line-number" data-line-number="181"></td>
        <td id="LC181" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L182" class="blob-num js-line-number" data-line-number="182"></td>
        <td id="LC182" class="blob-code blob-code-inner js-file-line">			}</td>
      </tr>
      <tr>
        <td id="L183" class="blob-num js-line-number" data-line-number="183"></td>
        <td id="LC183" class="blob-code blob-code-inner js-file-line">			</td>
      </tr>
      <tr>
        <td id="L184" class="blob-num js-line-number" data-line-number="184"></td>
        <td id="LC184" class="blob-code blob-code-inner js-file-line">        } <span class="pl-k">elsif</span> ((<span class="pl-smi">$language</span> <span class="pl-c1">eq</span> <span class="pl-s"><span class="pl-pds">&quot;</span>fi<span class="pl-pds">&quot;</span></span>) &amp;&amp; (<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>-1] =~ <span class="pl-sr"><span class="pl-pds">/</span>:<span class="pl-k">$</span><span class="pl-pds">/</span></span>) &amp;&amp; (<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>] =~ <span class="pl-sr"><span class="pl-pds">/</span>^(N|n|A|a|Ä|ä|ssa|Ssa|ssä|Ssä|sta|stä|Sta|Stä|hun|Hun|hyn|Hyn|han|Han|hän|Hän|hön|Hön|un|Un|yn|Yn|an|An|än|Än|ön|Ön|seen|Seen|lla|Lla|llä|Llä|lta|Lta|ltä|Ltä|lle|Lle|ksi|Ksi|kse|Kse|tta|Tta|ine|Ine)(ni|si|mme|nne|nsa)?(ko|kö|han|hän|pa|pä|kaan|kään|kin)?<span class="pl-k">$</span><span class="pl-pds">/</span></span>)) {</td>
      </tr>
      <tr>
        <td id="L185" class="blob-num js-line-number" data-line-number="185"></td>
        <td id="LC185" class="blob-code blob-code-inner js-file-line">            <span class="pl-c"># Finnish : without intervening space if followed by case suffix</span></td>
      </tr>
      <tr>
        <td id="L186" class="blob-num js-line-number" data-line-number="186"></td>
        <td id="LC186" class="blob-code blob-code-inner js-file-line">            <span class="pl-c"># EU:N EU:n EU:ssa EU:sta EU:hun EU:iin ...</span></td>
      </tr>
      <tr>
        <td id="L187" class="blob-num js-line-number" data-line-number="187"></td>
        <td id="LC187" class="blob-code blob-code-inner js-file-line">            <span class="pl-smi">$text</span>=<span class="pl-smi">$text</span>. <span class="pl-c1">lc</span> <span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>];</td>
      </tr>
      <tr>
        <td id="L188" class="blob-num js-line-number" data-line-number="188"></td>
        <td id="LC188" class="blob-code blob-code-inner js-file-line">            <span class="pl-smi">$prependSpace</span> = <span class="pl-s"><span class="pl-pds">&quot;</span> <span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L189" class="blob-num js-line-number" data-line-number="189"></td>
        <td id="LC189" class="blob-code blob-code-inner js-file-line">		} <span class="pl-k">else</span> {</td>
      </tr>
      <tr>
        <td id="L190" class="blob-num js-line-number" data-line-number="190"></td>
        <td id="LC190" class="blob-code blob-code-inner js-file-line">			<span class="pl-smi">$text</span>=<span class="pl-smi">$text</span>.<span class="pl-smi">$prependSpace</span>.<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>];</td>
      </tr>
      <tr>
        <td id="L191" class="blob-num js-line-number" data-line-number="191"></td>
        <td id="LC191" class="blob-code blob-code-inner js-file-line">			<span class="pl-smi">$prependSpace</span> = <span class="pl-s"><span class="pl-pds">&quot;</span> <span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L192" class="blob-num js-line-number" data-line-number="192"></td>
        <td id="LC192" class="blob-code blob-code-inner js-file-line">		}</td>
      </tr>
      <tr>
        <td id="L193" class="blob-num js-line-number" data-line-number="193"></td>
        <td id="LC193" class="blob-code blob-code-inner js-file-line">	}</td>
      </tr>
      <tr>
        <td id="L194" class="blob-num js-line-number" data-line-number="194"></td>
        <td id="LC194" class="blob-code blob-code-inner js-file-line">	</td>
      </tr>
      <tr>
        <td id="L195" class="blob-num js-line-number" data-line-number="195"></td>
        <td id="LC195" class="blob-code blob-code-inner js-file-line">	<span class="pl-c"># clean up spaces at head and tail of each line as well as any double-spacing</span></td>
      </tr>
      <tr>
        <td id="L196" class="blob-num js-line-number" data-line-number="196"></td>
        <td id="LC196" class="blob-code blob-code-inner js-file-line">	<span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span> +</span><span class="pl-sr"><span class="pl-pds">/</span> <span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;</td>
      </tr>
      <tr>
        <td id="L197" class="blob-num js-line-number" data-line-number="197"></td>
        <td id="LC197" class="blob-code blob-code-inner js-file-line">	<span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span><span class="pl-cce">\n</span> </span><span class="pl-sr"><span class="pl-pds">/</span><span class="pl-cce">\n</span><span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;</td>
      </tr>
      <tr>
        <td id="L198" class="blob-num js-line-number" data-line-number="198"></td>
        <td id="LC198" class="blob-code blob-code-inner js-file-line">	<span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span> <span class="pl-cce">\n</span></span><span class="pl-sr"><span class="pl-pds">/</span><span class="pl-cce">\n</span><span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;</td>
      </tr>
      <tr>
        <td id="L199" class="blob-num js-line-number" data-line-number="199"></td>
        <td id="LC199" class="blob-code blob-code-inner js-file-line">	<span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span>^ </span><span class="pl-sr"><span class="pl-pds">//</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;</td>
      </tr>
      <tr>
        <td id="L200" class="blob-num js-line-number" data-line-number="200"></td>
        <td id="LC200" class="blob-code blob-code-inner js-file-line">	<span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span> $</span><span class="pl-sr"><span class="pl-pds">//</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;</td>
      </tr>
      <tr>
        <td id="L201" class="blob-num js-line-number" data-line-number="201"></td>
        <td id="LC201" class="blob-code blob-code-inner js-file-line">	</td>
      </tr>
      <tr>
        <td id="L202" class="blob-num js-line-number" data-line-number="202"></td>
        <td id="LC202" class="blob-code blob-code-inner js-file-line">	<span class="pl-c">#add trailing break</span></td>
      </tr>
      <tr>
        <td id="L203" class="blob-num js-line-number" data-line-number="203"></td>
        <td id="LC203" class="blob-code blob-code-inner js-file-line">	<span class="pl-smi">$text</span> .= <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-cce">\n</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">unless</span> <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds">/</span><span class="pl-cce">\n</span><span class="pl-k">$</span><span class="pl-pds">/</span></span>;</td>
      </tr>
      <tr>
        <td id="L204" class="blob-num js-line-number" data-line-number="204"></td>
        <td id="LC204" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L205" class="blob-num js-line-number" data-line-number="205"></td>
        <td id="LC205" class="blob-code blob-code-inner js-file-line">        <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span>^([[:punct:]<span class="pl-cce">\s</span>]*)([[:alpha:]])</span><span class="pl-sr"><span class="pl-pds">/</span>ucsecondarg(<span class="pl-smi">$1</span>, <span class="pl-smi">$2</span>)<span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">e</span></span></span> <span class="pl-k">if</span> <span class="pl-smi">$UPPERCASE_SENT</span>;</td>
      </tr>
      <tr>
        <td id="L206" class="blob-num js-line-number" data-line-number="206"></td>
        <td id="LC206" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L207" class="blob-num js-line-number" data-line-number="207"></td>
        <td id="LC207" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">return</span> <span class="pl-smi">$text</span>;</td>
      </tr>
      <tr>
        <td id="L208" class="blob-num js-line-number" data-line-number="208"></td>
        <td id="LC208" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L209" class="blob-num js-line-number" data-line-number="209"></td>
        <td id="LC209" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L210" class="blob-num js-line-number" data-line-number="210"></td>
        <td id="LC210" class="blob-code blob-code-inner js-file-line"><span class="pl-k">sub</span> <span class="pl-en">detokenize_penn</span> {</td>
      </tr>
      <tr>
        <td id="L211" class="blob-num js-line-number" data-line-number="211"></td>
        <td id="LC211" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">my</span>(<span class="pl-smi">$text</span>) = <span class="pl-smi">@_</span>;</td>
      </tr>
      <tr>
        <td id="L212" class="blob-num js-line-number" data-line-number="212"></td>
        <td id="LC212" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L213" class="blob-num js-line-number" data-line-number="213"></td>
        <td id="LC213" class="blob-code blob-code-inner js-file-line">  <span class="pl-c1">chomp</span>(<span class="pl-smi">$text</span>);</td>
      </tr>
      <tr>
        <td id="L214" class="blob-num js-line-number" data-line-number="214"></td>
        <td id="LC214" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> = <span class="pl-s"><span class="pl-pds">&quot;</span> <span class="pl-smi">$text</span> <span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L215" class="blob-num js-line-number" data-line-number="215"></td>
        <td id="LC215" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span> <span class="pl-cce">\@\-\@</span> </span><span class="pl-sr"><span class="pl-pds">/</span>-<span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;</td>
      </tr>
      <tr>
        <td id="L216" class="blob-num js-line-number" data-line-number="216"></td>
        <td id="LC216" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span> <span class="pl-cce">\@\/\@</span> </span><span class="pl-sr"><span class="pl-pds">/</span><span class="pl-cce">\/</span><span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;</td>
      </tr>
      <tr>
        <td id="L217" class="blob-num js-line-number" data-line-number="217"></td>
        <td id="LC217" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> = &amp;deescape(<span class="pl-smi">$text</span>);</td>
      </tr>
      <tr>
        <td id="L218" class="blob-num js-line-number" data-line-number="218"></td>
        <td id="LC218" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L219" class="blob-num js-line-number" data-line-number="219"></td>
        <td id="LC219" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># merge de-contracted forms except where the second word begins with an</span></td>
      </tr>
      <tr>
        <td id="L220" class="blob-num js-line-number" data-line-number="220"></td>
        <td id="LC220" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># apostrophe (those are handled later)</span></td>
      </tr>
      <tr>
        <td id="L221" class="blob-num js-line-number" data-line-number="221"></td>
        <td id="LC221" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span> n&#39;t </span><span class="pl-sr"><span class="pl-pds">/</span>n&#39;t <span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;</td>
      </tr>
      <tr>
        <td id="L222" class="blob-num js-line-number" data-line-number="222"></td>
        <td id="LC222" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span> N&#39;T </span><span class="pl-sr"><span class="pl-pds">/</span>N&#39;T <span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;</td>
      </tr>
      <tr>
        <td id="L223" class="blob-num js-line-number" data-line-number="223"></td>
        <td id="LC223" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span> ([Cc])an not </span><span class="pl-sr"><span class="pl-pds">/</span> $1annot <span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;</td>
      </tr>
      <tr>
        <td id="L224" class="blob-num js-line-number" data-line-number="224"></td>
        <td id="LC224" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span> ([Dd])&#39; ye </span><span class="pl-sr"><span class="pl-pds">/</span> <span class="pl-smi">$1</span>&#39;ye <span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;</td>
      </tr>
      <tr>
        <td id="L225" class="blob-num js-line-number" data-line-number="225"></td>
        <td id="LC225" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span> ([Gg])im me </span><span class="pl-sr"><span class="pl-pds">/</span> $1imme <span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;</td>
      </tr>
      <tr>
        <td id="L226" class="blob-num js-line-number" data-line-number="226"></td>
        <td id="LC226" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span> ([Gg])on na </span><span class="pl-sr"><span class="pl-pds">/</span> $1onna <span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;</td>
      </tr>
      <tr>
        <td id="L227" class="blob-num js-line-number" data-line-number="227"></td>
        <td id="LC227" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span> ([Gg])ot ta </span><span class="pl-sr"><span class="pl-pds">/</span> $1otta <span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;</td>
      </tr>
      <tr>
        <td id="L228" class="blob-num js-line-number" data-line-number="228"></td>
        <td id="LC228" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span> ([Ll])em me </span><span class="pl-sr"><span class="pl-pds">/</span> $1emme <span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;</td>
      </tr>
      <tr>
        <td id="L229" class="blob-num js-line-number" data-line-number="229"></td>
        <td id="LC229" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span> &#39;([Tt]) is </span><span class="pl-sr"><span class="pl-pds">/</span> &#39;$1is <span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;</td>
      </tr>
      <tr>
        <td id="L230" class="blob-num js-line-number" data-line-number="230"></td>
        <td id="LC230" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span> &#39;([Tt]) was </span><span class="pl-sr"><span class="pl-pds">/</span> &#39;$1was <span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;</td>
      </tr>
      <tr>
        <td id="L231" class="blob-num js-line-number" data-line-number="231"></td>
        <td id="LC231" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span> ([Ww])an na </span><span class="pl-sr"><span class="pl-pds">/</span> $1anna <span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;</td>
      </tr>
      <tr>
        <td id="L232" class="blob-num js-line-number" data-line-number="232"></td>
        <td id="LC232" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L233" class="blob-num js-line-number" data-line-number="233"></td>
        <td id="LC233" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># restore brackets</span></td>
      </tr>
      <tr>
        <td id="L234" class="blob-num js-line-number" data-line-number="234"></td>
        <td id="LC234" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span>-LRB-</span><span class="pl-sr"><span class="pl-pds">/</span><span class="pl-cce">\(</span><span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;</td>
      </tr>
      <tr>
        <td id="L235" class="blob-num js-line-number" data-line-number="235"></td>
        <td id="LC235" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span>-RRB-</span><span class="pl-sr"><span class="pl-pds">/</span><span class="pl-cce">\)</span><span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;</td>
      </tr>
      <tr>
        <td id="L236" class="blob-num js-line-number" data-line-number="236"></td>
        <td id="LC236" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span>-LSB-</span><span class="pl-sr"><span class="pl-pds">/</span><span class="pl-cce">\[</span><span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;</td>
      </tr>
      <tr>
        <td id="L237" class="blob-num js-line-number" data-line-number="237"></td>
        <td id="LC237" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span>-RSB-</span><span class="pl-sr"><span class="pl-pds">/</span><span class="pl-cce">\]</span><span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;</td>
      </tr>
      <tr>
        <td id="L238" class="blob-num js-line-number" data-line-number="238"></td>
        <td id="LC238" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span>-LCB-</span><span class="pl-sr"><span class="pl-pds">/</span>{<span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;</td>
      </tr>
      <tr>
        <td id="L239" class="blob-num js-line-number" data-line-number="239"></td>
        <td id="LC239" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span>-RCB-</span><span class="pl-sr"><span class="pl-pds">/</span>}<span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;</td>
      </tr>
      <tr>
        <td id="L240" class="blob-num js-line-number" data-line-number="240"></td>
        <td id="LC240" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L241" class="blob-num js-line-number" data-line-number="241"></td>
        <td id="LC241" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">my</span> <span class="pl-smi">$i</span>;</td>
      </tr>
      <tr>
        <td id="L242" class="blob-num js-line-number" data-line-number="242"></td>
        <td id="LC242" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">my</span> <span class="pl-smi">@words</span> = <span class="pl-c1">split</span>(<span class="pl-sr"><span class="pl-pds">/</span> <span class="pl-pds">/</span></span>,<span class="pl-smi">$text</span>);</td>
      </tr>
      <tr>
        <td id="L243" class="blob-num js-line-number" data-line-number="243"></td>
        <td id="LC243" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> = <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L244" class="blob-num js-line-number" data-line-number="244"></td>
        <td id="LC244" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">my</span> <span class="pl-smi">$prependSpace</span> = <span class="pl-s"><span class="pl-pds">&quot;</span> <span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L245" class="blob-num js-line-number" data-line-number="245"></td>
        <td id="LC245" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">for</span> (<span class="pl-smi">$i</span>=0;<span class="pl-smi">$i</span>&lt;(<span class="pl-c1">scalar</span>(<span class="pl-smi">@words</span>));<span class="pl-smi">$i</span>++) {</td>
      </tr>
      <tr>
        <td id="L246" class="blob-num js-line-number" data-line-number="246"></td>
        <td id="LC246" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">if</span> (<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>] =~ <span class="pl-sr"><span class="pl-pds">/</span>^[<span class="pl-cce">\p{IsSc}\(\[\{\¿\¡</span>]+<span class="pl-k">$</span><span class="pl-pds">/</span></span>) {</td>
      </tr>
      <tr>
        <td id="L247" class="blob-num js-line-number" data-line-number="247"></td>
        <td id="LC247" class="blob-code blob-code-inner js-file-line">      <span class="pl-c"># perform right shift on currency and other random punctuation items</span></td>
      </tr>
      <tr>
        <td id="L248" class="blob-num js-line-number" data-line-number="248"></td>
        <td id="LC248" class="blob-code blob-code-inner js-file-line">      <span class="pl-smi">$text</span> = <span class="pl-smi">$text</span>.<span class="pl-smi">$prependSpace</span>.<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>];</td>
      </tr>
      <tr>
        <td id="L249" class="blob-num js-line-number" data-line-number="249"></td>
        <td id="LC249" class="blob-code blob-code-inner js-file-line">      <span class="pl-smi">$prependSpace</span> = <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L250" class="blob-num js-line-number" data-line-number="250"></td>
        <td id="LC250" class="blob-code blob-code-inner js-file-line">    } <span class="pl-k">elsif</span> (<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>] =~ <span class="pl-sr"><span class="pl-pds">/</span>^[<span class="pl-cce">\,\.\?\!\:\;\\\%\}\]\)</span>]+<span class="pl-k">$</span><span class="pl-pds">/</span></span>){</td>
      </tr>
      <tr>
        <td id="L251" class="blob-num js-line-number" data-line-number="251"></td>
        <td id="LC251" class="blob-code blob-code-inner js-file-line">      <span class="pl-c"># perform left shift on punctuation items</span></td>
      </tr>
      <tr>
        <td id="L252" class="blob-num js-line-number" data-line-number="252"></td>
        <td id="LC252" class="blob-code blob-code-inner js-file-line">      <span class="pl-smi">$text</span>=<span class="pl-smi">$text</span>.<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>];</td>
      </tr>
      <tr>
        <td id="L253" class="blob-num js-line-number" data-line-number="253"></td>
        <td id="LC253" class="blob-code blob-code-inner js-file-line">      <span class="pl-smi">$prependSpace</span> = <span class="pl-s"><span class="pl-pds">&quot;</span> <span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L254" class="blob-num js-line-number" data-line-number="254"></td>
        <td id="LC254" class="blob-code blob-code-inner js-file-line">    } <span class="pl-k">elsif</span> ((<span class="pl-smi">$i</span>&gt;0) &amp;&amp; (<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>] =~ <span class="pl-sr"><span class="pl-pds">/</span>^[<span class="pl-cce">\&#39;</span>][<span class="pl-cce">\p{IsAlpha}</span>]<span class="pl-pds">/</span></span>) &amp;&amp; (<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>-1] =~ <span class="pl-sr"><span class="pl-pds">/</span>[<span class="pl-cce">\p{IsAlnum}</span>]<span class="pl-k">$</span><span class="pl-pds">/</span></span>)) {</td>
      </tr>
      <tr>
        <td id="L255" class="blob-num js-line-number" data-line-number="255"></td>
        <td id="LC255" class="blob-code blob-code-inner js-file-line">      <span class="pl-c"># left-shift the contraction</span></td>
      </tr>
      <tr>
        <td id="L256" class="blob-num js-line-number" data-line-number="256"></td>
        <td id="LC256" class="blob-code blob-code-inner js-file-line">      <span class="pl-smi">$text</span>=<span class="pl-smi">$text</span>.<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>];</td>
      </tr>
      <tr>
        <td id="L257" class="blob-num js-line-number" data-line-number="257"></td>
        <td id="LC257" class="blob-code blob-code-inner js-file-line">      <span class="pl-smi">$prependSpace</span> = <span class="pl-s"><span class="pl-pds">&quot;</span> <span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L258" class="blob-num js-line-number" data-line-number="258"></td>
        <td id="LC258" class="blob-code blob-code-inner js-file-line">    } <span class="pl-k">elsif</span> (<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>] <span class="pl-c1">eq</span> <span class="pl-s"><span class="pl-pds">&quot;</span>`<span class="pl-pds">&quot;</span></span>) { <span class="pl-c"># Assume that punctuation has been normalized and is one of `, ``, &#39;, &#39;&#39; only</span></td>
      </tr>
      <tr>
        <td id="L259" class="blob-num js-line-number" data-line-number="259"></td>
        <td id="LC259" class="blob-code blob-code-inner js-file-line">      <span class="pl-c"># opening single quote: convert to straight quote and right-shift</span></td>
      </tr>
      <tr>
        <td id="L260" class="blob-num js-line-number" data-line-number="260"></td>
        <td id="LC260" class="blob-code blob-code-inner js-file-line">      <span class="pl-smi">$text</span> = <span class="pl-smi">$text</span>.<span class="pl-smi">$prependSpace</span>.<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-cce">\&#39;</span><span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L261" class="blob-num js-line-number" data-line-number="261"></td>
        <td id="LC261" class="blob-code blob-code-inner js-file-line">      <span class="pl-smi">$prependSpace</span> = <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L262" class="blob-num js-line-number" data-line-number="262"></td>
        <td id="LC262" class="blob-code blob-code-inner js-file-line">    } <span class="pl-k">elsif</span> (<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>] <span class="pl-c1">eq</span> <span class="pl-s"><span class="pl-pds">&quot;</span>``<span class="pl-pds">&quot;</span></span>) {</td>
      </tr>
      <tr>
        <td id="L263" class="blob-num js-line-number" data-line-number="263"></td>
        <td id="LC263" class="blob-code blob-code-inner js-file-line">      <span class="pl-c"># opening double quote: convert to straight quote and right-shift</span></td>
      </tr>
      <tr>
        <td id="L264" class="blob-num js-line-number" data-line-number="264"></td>
        <td id="LC264" class="blob-code blob-code-inner js-file-line">      <span class="pl-smi">$text</span> = <span class="pl-smi">$text</span>.<span class="pl-smi">$prependSpace</span>.<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-cce">\&quot;</span><span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L265" class="blob-num js-line-number" data-line-number="265"></td>
        <td id="LC265" class="blob-code blob-code-inner js-file-line">      <span class="pl-smi">$prependSpace</span> = <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L266" class="blob-num js-line-number" data-line-number="266"></td>
        <td id="LC266" class="blob-code blob-code-inner js-file-line">    } <span class="pl-k">elsif</span> (<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>] <span class="pl-c1">eq</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-cce">\&#39;</span><span class="pl-pds">&quot;</span></span>) {</td>
      </tr>
      <tr>
        <td id="L267" class="blob-num js-line-number" data-line-number="267"></td>
        <td id="LC267" class="blob-code blob-code-inner js-file-line">      <span class="pl-c"># closing single quote: convert to straight quote and left shift</span></td>
      </tr>
      <tr>
        <td id="L268" class="blob-num js-line-number" data-line-number="268"></td>
        <td id="LC268" class="blob-code blob-code-inner js-file-line">      <span class="pl-smi">$text</span> = <span class="pl-smi">$text</span>.<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-cce">\&#39;</span><span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L269" class="blob-num js-line-number" data-line-number="269"></td>
        <td id="LC269" class="blob-code blob-code-inner js-file-line">      <span class="pl-smi">$prependSpace</span> = <span class="pl-s"><span class="pl-pds">&quot;</span> <span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L270" class="blob-num js-line-number" data-line-number="270"></td>
        <td id="LC270" class="blob-code blob-code-inner js-file-line">    } <span class="pl-k">elsif</span> (<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>] <span class="pl-c1">eq</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-cce">\&#39;\&#39;</span><span class="pl-pds">&quot;</span></span>) {</td>
      </tr>
      <tr>
        <td id="L271" class="blob-num js-line-number" data-line-number="271"></td>
        <td id="LC271" class="blob-code blob-code-inner js-file-line">      <span class="pl-c"># closing double quote: convert to straight quote and left shift</span></td>
      </tr>
      <tr>
        <td id="L272" class="blob-num js-line-number" data-line-number="272"></td>
        <td id="LC272" class="blob-code blob-code-inner js-file-line">      <span class="pl-smi">$text</span> = <span class="pl-smi">$text</span>.<span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-cce">\&quot;</span><span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L273" class="blob-num js-line-number" data-line-number="273"></td>
        <td id="LC273" class="blob-code blob-code-inner js-file-line">      <span class="pl-smi">$prependSpace</span> = <span class="pl-s"><span class="pl-pds">&quot;</span> <span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L274" class="blob-num js-line-number" data-line-number="274"></td>
        <td id="LC274" class="blob-code blob-code-inner js-file-line">    } <span class="pl-k">else</span> {</td>
      </tr>
      <tr>
        <td id="L275" class="blob-num js-line-number" data-line-number="275"></td>
        <td id="LC275" class="blob-code blob-code-inner js-file-line">      <span class="pl-smi">$text</span> = <span class="pl-smi">$text</span>.<span class="pl-smi">$prependSpace</span>.<span class="pl-smi">$words</span>[<span class="pl-smi">$i</span>];</td>
      </tr>
      <tr>
        <td id="L276" class="blob-num js-line-number" data-line-number="276"></td>
        <td id="LC276" class="blob-code blob-code-inner js-file-line">      <span class="pl-smi">$prependSpace</span> = <span class="pl-s"><span class="pl-pds">&quot;</span> <span class="pl-pds">&quot;</span></span>;</td>
      </tr>
      <tr>
        <td id="L277" class="blob-num js-line-number" data-line-number="277"></td>
        <td id="LC277" class="blob-code blob-code-inner js-file-line">    }</td>
      </tr>
      <tr>
        <td id="L278" class="blob-num js-line-number" data-line-number="278"></td>
        <td id="LC278" class="blob-code blob-code-inner js-file-line">  }</td>
      </tr>
      <tr>
        <td id="L279" class="blob-num js-line-number" data-line-number="279"></td>
        <td id="LC279" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L280" class="blob-num js-line-number" data-line-number="280"></td>
        <td id="LC280" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># clean up spaces at head and tail of each line as well as any double-spacing</span></td>
      </tr>
      <tr>
        <td id="L281" class="blob-num js-line-number" data-line-number="281"></td>
        <td id="LC281" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span> +</span><span class="pl-sr"><span class="pl-pds">/</span> <span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;</td>
      </tr>
      <tr>
        <td id="L282" class="blob-num js-line-number" data-line-number="282"></td>
        <td id="LC282" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span><span class="pl-cce">\n</span> </span><span class="pl-sr"><span class="pl-pds">/</span><span class="pl-cce">\n</span><span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;</td>
      </tr>
      <tr>
        <td id="L283" class="blob-num js-line-number" data-line-number="283"></td>
        <td id="LC283" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span> <span class="pl-cce">\n</span></span><span class="pl-sr"><span class="pl-pds">/</span><span class="pl-cce">\n</span><span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;</td>
      </tr>
      <tr>
        <td id="L284" class="blob-num js-line-number" data-line-number="284"></td>
        <td id="LC284" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span>^ </span><span class="pl-sr"><span class="pl-pds">//</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;</td>
      </tr>
      <tr>
        <td id="L285" class="blob-num js-line-number" data-line-number="285"></td>
        <td id="LC285" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span> $</span><span class="pl-sr"><span class="pl-pds">//</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">g</span></span></span>;</td>
      </tr>
      <tr>
        <td id="L286" class="blob-num js-line-number" data-line-number="286"></td>
        <td id="LC286" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L287" class="blob-num js-line-number" data-line-number="287"></td>
        <td id="LC287" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"># add trailing break</span></td>
      </tr>
      <tr>
        <td id="L288" class="blob-num js-line-number" data-line-number="288"></td>
        <td id="LC288" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> .= <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-cce">\n</span><span class="pl-pds">&quot;</span></span> <span class="pl-k">unless</span> <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds">/</span><span class="pl-cce">\n</span><span class="pl-k">$</span><span class="pl-pds">/</span></span>;</td>
      </tr>
      <tr>
        <td id="L289" class="blob-num js-line-number" data-line-number="289"></td>
        <td id="LC289" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L290" class="blob-num js-line-number" data-line-number="290"></td>
        <td id="LC290" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">$text</span> =~ <span class="pl-sr"><span class="pl-pds"><span class="pl-c1">s</span>/</span>^([[:punct:]<span class="pl-cce">\s</span>]*)([[:alpha:]])</span><span class="pl-sr"><span class="pl-pds">/</span>ucsecondarg(<span class="pl-smi">$1</span>, <span class="pl-smi">$2</span>)<span class="pl-pds">/</span></span><span class="pl-sr"><span class="pl-pds"><span class="pl-k">e</span></span></span> <span class="pl-k">if</span> <span class="pl-smi">$UPPERCASE_SENT</span>;</td>
      </tr>
      <tr>
        <td id="L291" class="blob-num js-line-number" data-line-number="291"></td>
        <td id="LC291" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L292" class="blob-num js-line-number" data-line-number="292"></td>
        <td id="LC292" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">return</span> <span class="pl-smi">$text</span>;</td>
      </tr>
      <tr>
        <td id="L293" class="blob-num js-line-number" data-line-number="293"></td>
        <td id="LC293" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L294" class="blob-num js-line-number" data-line-number="294"></td>
        <td id="LC294" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L295" class="blob-num js-line-number" data-line-number="295"></td>
        <td id="LC295" class="blob-code blob-code-inner js-file-line"><span class="pl-k">sub</span> <span class="pl-en">startsWithCJKChar</span> {</td>
      </tr>
      <tr>
        <td id="L296" class="blob-num js-line-number" data-line-number="296"></td>
        <td id="LC296" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">my</span> (<span class="pl-smi">$str</span>) = <span class="pl-smi">@_</span>;</td>
      </tr>
      <tr>
        <td id="L297" class="blob-num js-line-number" data-line-number="297"></td>
        <td id="LC297" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">return</span> 0 <span class="pl-k">if</span> <span class="pl-c1">length</span>(<span class="pl-smi">$str</span>) == 0;</td>
      </tr>
      <tr>
        <td id="L298" class="blob-num js-line-number" data-line-number="298"></td>
        <td id="LC298" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">my</span> <span class="pl-smi">$firstChar</span> = <span class="pl-c1">substr</span>(<span class="pl-smi">$str</span>, 0, 1);</td>
      </tr>
      <tr>
        <td id="L299" class="blob-num js-line-number" data-line-number="299"></td>
        <td id="LC299" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">return</span> &amp;charIsCJK(<span class="pl-smi">$firstChar</span>);</td>
      </tr>
      <tr>
        <td id="L300" class="blob-num js-line-number" data-line-number="300"></td>
        <td id="LC300" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L301" class="blob-num js-line-number" data-line-number="301"></td>
        <td id="LC301" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L302" class="blob-num js-line-number" data-line-number="302"></td>
        <td id="LC302" class="blob-code blob-code-inner js-file-line"><span class="pl-k">sub</span> <span class="pl-en">endsWithCJKChar</span> {</td>
      </tr>
      <tr>
        <td id="L303" class="blob-num js-line-number" data-line-number="303"></td>
        <td id="LC303" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">my</span> (<span class="pl-smi">$str</span>) = <span class="pl-smi">@_</span>;</td>
      </tr>
      <tr>
        <td id="L304" class="blob-num js-line-number" data-line-number="304"></td>
        <td id="LC304" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">return</span> 0 <span class="pl-k">if</span> <span class="pl-c1">length</span>(<span class="pl-smi">$str</span>) == 0;</td>
      </tr>
      <tr>
        <td id="L305" class="blob-num js-line-number" data-line-number="305"></td>
        <td id="LC305" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">my</span> <span class="pl-smi">$lastChar</span> = <span class="pl-c1">substr</span>(<span class="pl-smi">$str</span>, <span class="pl-c1">length</span>(<span class="pl-smi">$str</span>)-1, 1);</td>
      </tr>
      <tr>
        <td id="L306" class="blob-num js-line-number" data-line-number="306"></td>
        <td id="LC306" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">return</span> &amp;charIsCJK(<span class="pl-smi">$lastChar</span>);</td>
      </tr>
      <tr>
        <td id="L307" class="blob-num js-line-number" data-line-number="307"></td>
        <td id="LC307" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L308" class="blob-num js-line-number" data-line-number="308"></td>
        <td id="LC308" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L309" class="blob-num js-line-number" data-line-number="309"></td>
        <td id="LC309" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Given a string consisting of one character, returns true iff the character</span></td>
      </tr>
      <tr>
        <td id="L310" class="blob-num js-line-number" data-line-number="310"></td>
        <td id="LC310" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># is a CJK (Chinese/Japanese/Korean) character</span></td>
      </tr>
      <tr>
        <td id="L311" class="blob-num js-line-number" data-line-number="311"></td>
        <td id="LC311" class="blob-code blob-code-inner js-file-line"><span class="pl-k">sub</span> <span class="pl-en">charIsCJK</span> {</td>
      </tr>
      <tr>
        <td id="L312" class="blob-num js-line-number" data-line-number="312"></td>
        <td id="LC312" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">my</span> (<span class="pl-smi">$char</span>) = <span class="pl-smi">@_</span>;</td>
      </tr>
      <tr>
        <td id="L313" class="blob-num js-line-number" data-line-number="313"></td>
        <td id="LC313" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># $char should be a string of length 1</span></td>
      </tr>
      <tr>
        <td id="L314" class="blob-num js-line-number" data-line-number="314"></td>
        <td id="LC314" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">my</span> <span class="pl-smi">$codepoint</span> = &amp;codepoint_dec(<span class="pl-smi">$char</span>);</td>
      </tr>
      <tr>
        <td id="L315" class="blob-num js-line-number" data-line-number="315"></td>
        <td id="LC315" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L316" class="blob-num js-line-number" data-line-number="316"></td>
        <td id="LC316" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># The following is based on http://en.wikipedia.org/wiki/Basic_Multilingual_Plane#Basic_Multilingual_Plane</span></td>
      </tr>
      <tr>
        <td id="L317" class="blob-num js-line-number" data-line-number="317"></td>
        <td id="LC317" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L318" class="blob-num js-line-number" data-line-number="318"></td>
        <td id="LC318" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># Hangul Jamo (1100–11FF)</span></td>
      </tr>
      <tr>
        <td id="L319" class="blob-num js-line-number" data-line-number="319"></td>
        <td id="LC319" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">return</span> 1 <span class="pl-k">if</span> (&amp;between_hexes(<span class="pl-smi">$codepoint</span>, <span class="pl-s"><span class="pl-pds">&#39;</span>1100<span class="pl-pds">&#39;</span></span>, <span class="pl-s"><span class="pl-pds">&#39;</span>11FF<span class="pl-pds">&#39;</span></span>));</td>
      </tr>
      <tr>
        <td id="L320" class="blob-num js-line-number" data-line-number="320"></td>
        <td id="LC320" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L321" class="blob-num js-line-number" data-line-number="321"></td>
        <td id="LC321" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># CJK Radicals Supplement (2E80–2EFF)</span></td>
      </tr>
      <tr>
        <td id="L322" class="blob-num js-line-number" data-line-number="322"></td>
        <td id="LC322" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># Kangxi Radicals (2F00–2FDF)</span></td>
      </tr>
      <tr>
        <td id="L323" class="blob-num js-line-number" data-line-number="323"></td>
        <td id="LC323" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># Ideographic Description Characters (2FF0–2FFF)</span></td>
      </tr>
      <tr>
        <td id="L324" class="blob-num js-line-number" data-line-number="324"></td>
        <td id="LC324" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># CJK Symbols and Punctuation (3000–303F)</span></td>
      </tr>
      <tr>
        <td id="L325" class="blob-num js-line-number" data-line-number="325"></td>
        <td id="LC325" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># Hiragana (3040–309F)</span></td>
      </tr>
      <tr>
        <td id="L326" class="blob-num js-line-number" data-line-number="326"></td>
        <td id="LC326" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># Katakana (30A0–30FF)</span></td>
      </tr>
      <tr>
        <td id="L327" class="blob-num js-line-number" data-line-number="327"></td>
        <td id="LC327" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># Bopomofo (3100–312F)</span></td>
      </tr>
      <tr>
        <td id="L328" class="blob-num js-line-number" data-line-number="328"></td>
        <td id="LC328" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># Hangul Compatibility Jamo (3130–318F)</span></td>
      </tr>
      <tr>
        <td id="L329" class="blob-num js-line-number" data-line-number="329"></td>
        <td id="LC329" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># Kanbun (3190–319F)</span></td>
      </tr>
      <tr>
        <td id="L330" class="blob-num js-line-number" data-line-number="330"></td>
        <td id="LC330" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># Bopomofo Extended (31A0–31BF)</span></td>
      </tr>
      <tr>
        <td id="L331" class="blob-num js-line-number" data-line-number="331"></td>
        <td id="LC331" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># CJK Strokes (31C0–31EF)</span></td>
      </tr>
      <tr>
        <td id="L332" class="blob-num js-line-number" data-line-number="332"></td>
        <td id="LC332" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># Katakana Phonetic Extensions (31F0–31FF)</span></td>
      </tr>
      <tr>
        <td id="L333" class="blob-num js-line-number" data-line-number="333"></td>
        <td id="LC333" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># Enclosed CJK Letters and Months (3200–32FF)</span></td>
      </tr>
      <tr>
        <td id="L334" class="blob-num js-line-number" data-line-number="334"></td>
        <td id="LC334" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># CJK Compatibility (3300–33FF)</span></td>
      </tr>
      <tr>
        <td id="L335" class="blob-num js-line-number" data-line-number="335"></td>
        <td id="LC335" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># CJK Unified Ideographs Extension A (3400–4DBF)</span></td>
      </tr>
      <tr>
        <td id="L336" class="blob-num js-line-number" data-line-number="336"></td>
        <td id="LC336" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># Yijing Hexagram Symbols (4DC0–4DFF)</span></td>
      </tr>
      <tr>
        <td id="L337" class="blob-num js-line-number" data-line-number="337"></td>
        <td id="LC337" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># CJK Unified Ideographs (4E00–9FFF)</span></td>
      </tr>
      <tr>
        <td id="L338" class="blob-num js-line-number" data-line-number="338"></td>
        <td id="LC338" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># Yi Syllables (A000–A48F)</span></td>
      </tr>
      <tr>
        <td id="L339" class="blob-num js-line-number" data-line-number="339"></td>
        <td id="LC339" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># Yi Radicals (A490–A4CF)</span></td>
      </tr>
      <tr>
        <td id="L340" class="blob-num js-line-number" data-line-number="340"></td>
        <td id="LC340" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">return</span> 1 <span class="pl-k">if</span> (&amp;between_hexes(<span class="pl-smi">$codepoint</span>, <span class="pl-s"><span class="pl-pds">&#39;</span>2E80<span class="pl-pds">&#39;</span></span>, <span class="pl-s"><span class="pl-pds">&#39;</span>A4CF<span class="pl-pds">&#39;</span></span>));</td>
      </tr>
      <tr>
        <td id="L341" class="blob-num js-line-number" data-line-number="341"></td>
        <td id="LC341" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L342" class="blob-num js-line-number" data-line-number="342"></td>
        <td id="LC342" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># Phags-pa (A840–A87F)</span></td>
      </tr>
      <tr>
        <td id="L343" class="blob-num js-line-number" data-line-number="343"></td>
        <td id="LC343" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">return</span> 1 <span class="pl-k">if</span> (&amp;between_hexes(<span class="pl-smi">$codepoint</span>, <span class="pl-s"><span class="pl-pds">&#39;</span>A840<span class="pl-pds">&#39;</span></span>, <span class="pl-s"><span class="pl-pds">&#39;</span>A87F<span class="pl-pds">&#39;</span></span>));</td>
      </tr>
      <tr>
        <td id="L344" class="blob-num js-line-number" data-line-number="344"></td>
        <td id="LC344" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L345" class="blob-num js-line-number" data-line-number="345"></td>
        <td id="LC345" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># Hangul Syllables (AC00–D7AF)</span></td>
      </tr>
      <tr>
        <td id="L346" class="blob-num js-line-number" data-line-number="346"></td>
        <td id="LC346" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">return</span> 1 <span class="pl-k">if</span> (&amp;between_hexes(<span class="pl-smi">$codepoint</span>, <span class="pl-s"><span class="pl-pds">&#39;</span>AC00<span class="pl-pds">&#39;</span></span>, <span class="pl-s"><span class="pl-pds">&#39;</span>D7AF<span class="pl-pds">&#39;</span></span>));</td>
      </tr>
      <tr>
        <td id="L347" class="blob-num js-line-number" data-line-number="347"></td>
        <td id="LC347" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L348" class="blob-num js-line-number" data-line-number="348"></td>
        <td id="LC348" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># CJK Compatibility Ideographs (F900–FAFF)</span></td>
      </tr>
      <tr>
        <td id="L349" class="blob-num js-line-number" data-line-number="349"></td>
        <td id="LC349" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">return</span> 1 <span class="pl-k">if</span> (&amp;between_hexes(<span class="pl-smi">$codepoint</span>, <span class="pl-s"><span class="pl-pds">&#39;</span>F900<span class="pl-pds">&#39;</span></span>, <span class="pl-s"><span class="pl-pds">&#39;</span>FAFF<span class="pl-pds">&#39;</span></span>));</td>
      </tr>
      <tr>
        <td id="L350" class="blob-num js-line-number" data-line-number="350"></td>
        <td id="LC350" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L351" class="blob-num js-line-number" data-line-number="351"></td>
        <td id="LC351" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># CJK Compatibility Forms (FE30–FE4F)</span></td>
      </tr>
      <tr>
        <td id="L352" class="blob-num js-line-number" data-line-number="352"></td>
        <td id="LC352" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">return</span> 1 <span class="pl-k">if</span> (&amp;between_hexes(<span class="pl-smi">$codepoint</span>, <span class="pl-s"><span class="pl-pds">&#39;</span>FE30<span class="pl-pds">&#39;</span></span>, <span class="pl-s"><span class="pl-pds">&#39;</span>FE4F<span class="pl-pds">&#39;</span></span>));</td>
      </tr>
      <tr>
        <td id="L353" class="blob-num js-line-number" data-line-number="353"></td>
        <td id="LC353" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L354" class="blob-num js-line-number" data-line-number="354"></td>
        <td id="LC354" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># Range U+FF65–FFDC encodes halfwidth forms, of Katakana and Hangul characters</span></td>
      </tr>
      <tr>
        <td id="L355" class="blob-num js-line-number" data-line-number="355"></td>
        <td id="LC355" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">return</span> 1 <span class="pl-k">if</span> (&amp;between_hexes(<span class="pl-smi">$codepoint</span>, <span class="pl-s"><span class="pl-pds">&#39;</span>FF65<span class="pl-pds">&#39;</span></span>, <span class="pl-s"><span class="pl-pds">&#39;</span>FFDC<span class="pl-pds">&#39;</span></span>));</td>
      </tr>
      <tr>
        <td id="L356" class="blob-num js-line-number" data-line-number="356"></td>
        <td id="LC356" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L357" class="blob-num js-line-number" data-line-number="357"></td>
        <td id="LC357" class="blob-code blob-code-inner js-file-line">    <span class="pl-c"># Supplementary Ideographic Plane 20000–2FFFF</span></td>
      </tr>
      <tr>
        <td id="L358" class="blob-num js-line-number" data-line-number="358"></td>
        <td id="LC358" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">return</span> 1 <span class="pl-k">if</span> (&amp;between_hexes(<span class="pl-smi">$codepoint</span>, <span class="pl-s"><span class="pl-pds">&#39;</span>20000<span class="pl-pds">&#39;</span></span>, <span class="pl-s"><span class="pl-pds">&#39;</span>2FFFF<span class="pl-pds">&#39;</span></span>));</td>
      </tr>
      <tr>
        <td id="L359" class="blob-num js-line-number" data-line-number="359"></td>
        <td id="LC359" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L360" class="blob-num js-line-number" data-line-number="360"></td>
        <td id="LC360" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">return</span> 0;</td>
      </tr>
      <tr>
        <td id="L361" class="blob-num js-line-number" data-line-number="361"></td>
        <td id="LC361" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L362" class="blob-num js-line-number" data-line-number="362"></td>
        <td id="LC362" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L363" class="blob-num js-line-number" data-line-number="363"></td>
        <td id="LC363" class="blob-code blob-code-inner js-file-line"><span class="pl-c"># Returns the code point of a Unicode char, represented as a decimal number</span></td>
      </tr>
      <tr>
        <td id="L364" class="blob-num js-line-number" data-line-number="364"></td>
        <td id="LC364" class="blob-code blob-code-inner js-file-line"><span class="pl-k">sub</span> <span class="pl-en">codepoint_dec</span> {</td>
      </tr>
      <tr>
        <td id="L365" class="blob-num js-line-number" data-line-number="365"></td>
        <td id="LC365" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">if</span> (<span class="pl-k">my</span> <span class="pl-smi">$char</span> = <span class="pl-c1">shift</span>) {</td>
      </tr>
      <tr>
        <td id="L366" class="blob-num js-line-number" data-line-number="366"></td>
        <td id="LC366" class="blob-code blob-code-inner js-file-line">	<span class="pl-k">return</span> <span class="pl-c1">unpack</span>(<span class="pl-s"><span class="pl-pds">&#39;</span>U0U*<span class="pl-pds">&#39;</span></span>, <span class="pl-smi">$char</span>);</td>
      </tr>
      <tr>
        <td id="L367" class="blob-num js-line-number" data-line-number="367"></td>
        <td id="LC367" class="blob-code blob-code-inner js-file-line">    }</td>
      </tr>
      <tr>
        <td id="L368" class="blob-num js-line-number" data-line-number="368"></td>
        <td id="LC368" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L369" class="blob-num js-line-number" data-line-number="369"></td>
        <td id="LC369" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L370" class="blob-num js-line-number" data-line-number="370"></td>
        <td id="LC370" class="blob-code blob-code-inner js-file-line"><span class="pl-k">sub</span> <span class="pl-en">between_hexes</span> {</td>
      </tr>
      <tr>
        <td id="L371" class="blob-num js-line-number" data-line-number="371"></td>
        <td id="LC371" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">my</span> (<span class="pl-smi">$num</span>, <span class="pl-smi">$left</span>, <span class="pl-smi">$right</span>) = <span class="pl-smi">@_</span>;</td>
      </tr>
      <tr>
        <td id="L372" class="blob-num js-line-number" data-line-number="372"></td>
        <td id="LC372" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">return</span> <span class="pl-smi">$num</span> &gt;= <span class="pl-c1">hex</span>(<span class="pl-smi">$left</span>) &amp;&amp; <span class="pl-smi">$num</span> &lt;= <span class="pl-c1">hex</span>(<span class="pl-smi">$right</span>);</td>
      </tr>
      <tr>
        <td id="L373" class="blob-num js-line-number" data-line-number="373"></td>
        <td id="LC373" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
</table>

  </div>

</div>

<button type="button" data-facebox="#jump-to-line" data-facebox-class="linejump" data-hotkey="l" class="d-none">Jump to Line</button>
<div id="jump-to-line" style="display:none">
  <!-- '"` --><!-- </textarea></xmp> --></option></form><form accept-charset="UTF-8" action="" class="js-jump-to-line-form" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
    <input class="form-control linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" aria-label="Jump to line" autofocus>
    <button type="submit" class="btn">Go</button>
</form></div>

  </div>
  <div class="modal-backdrop js-touch-events"></div>
</div>


    </div>
  </div>

    </div>

        <div class="container site-footer-container">
  <div class="site-footer" role="contentinfo">
    <ul class="site-footer-links float-right">
        <li><a href="https://github.com/contact" data-ga-click="Footer, go to contact, text:contact">Contact GitHub</a></li>
      <li><a href="https://developer.github.com" data-ga-click="Footer, go to api, text:api">API</a></li>
      <li><a href="https://training.github.com" data-ga-click="Footer, go to training, text:training">Training</a></li>
      <li><a href="https://shop.github.com" data-ga-click="Footer, go to shop, text:shop">Shop</a></li>
        <li><a href="https://github.com/blog" data-ga-click="Footer, go to blog, text:blog">Blog</a></li>
        <li><a href="https://github.com/about" data-ga-click="Footer, go to about, text:about">About</a></li>

    </ul>

    <a href="https://github.com" aria-label="Homepage" class="site-footer-mark" title="GitHub">
      <svg aria-hidden="true" class="octicon octicon-mark-github" height="24" version="1.1" viewBox="0 0 16 16" width="24"><path fill-rule="evenodd" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0 0 16 8c0-4.42-3.58-8-8-8z"/></svg>
</a>
    <ul class="site-footer-links">
      <li>&copy; 2016 <span title="0.13266s from github-fe-83bc574.cp1-iad.github.net">GitHub</span>, Inc.</li>
        <li><a href="https://github.com/site/terms" data-ga-click="Footer, go to terms, text:terms">Terms</a></li>
        <li><a href="https://github.com/site/privacy" data-ga-click="Footer, go to privacy, text:privacy">Privacy</a></li>
        <li><a href="https://github.com/security" data-ga-click="Footer, go to security, text:security">Security</a></li>
        <li><a href="https://status.github.com/" data-ga-click="Footer, go to status, text:status">Status</a></li>
        <li><a href="https://help.github.com" data-ga-click="Footer, go to help, text:help">Help</a></li>
    </ul>
  </div>
</div>



    

    <div id="ajax-error-message" class="ajax-error-message flash flash-error">
      <svg aria-hidden="true" class="octicon octicon-alert" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M8.865 1.52c-.18-.31-.51-.5-.87-.5s-.69.19-.87.5L.275 13.5c-.18.31-.18.69 0 1 .19.31.52.5.87.5h13.7c.36 0 .69-.19.86-.5.17-.31.18-.69.01-1L8.865 1.52zM8.995 13h-2v-2h2v2zm0-3h-2V6h2v4z"/></svg>
      <button type="button" class="flash-close js-flash-close js-ajax-error-dismiss" aria-label="Dismiss error">
        <svg aria-hidden="true" class="octicon octicon-x" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48z"/></svg>
      </button>
      You can't perform that action at this time.
    </div>


      
      <script crossorigin="anonymous" integrity="sha256-DMR8cHsW+5TLrHHR4vXyEb6jIj7+yu+pJIYwpCKkqJk=" src="https://assets-cdn.github.com/assets/frameworks-0cc47c707b16fb94cbac71d1e2f5f211bea3223efecaefa9248630a422a4a899.js"></script>
      <script async="async" crossorigin="anonymous" integrity="sha256-9OXJ/RyDIX2OJHzObcIkdwt5tfgb3BeRrWNhpxf3Ckk=" src="https://assets-cdn.github.com/assets/github-f4e5c9fd1c83217d8e247cce6dc224770b79b5f81bdc1791ad6361a717f70a49.js"></script>
      
      
      
      
    <div class="js-stale-session-flash stale-session-flash flash flash-warn flash-banner d-none">
      <svg aria-hidden="true" class="octicon octicon-alert" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M8.865 1.52c-.18-.31-.51-.5-.87-.5s-.69.19-.87.5L.275 13.5c-.18.31-.18.69 0 1 .19.31.52.5.87.5h13.7c.36 0 .69-.19.86-.5.17-.31.18-.69.01-1L8.865 1.52zM8.995 13h-2v-2h2v2zm0-3h-2V6h2v4z"/></svg>
      <span class="signed-in-tab-flash">You signed in with another tab or window. <a href="">Reload</a> to refresh your session.</span>
      <span class="signed-out-tab-flash">You signed out in another tab or window. <a href="">Reload</a> to refresh your session.</span>
    </div>
    <div class="facebox" id="facebox" style="display:none;">
  <div class="facebox-popup">
    <div class="facebox-content" role="dialog" aria-labelledby="facebox-header" aria-describedby="facebox-description">
    </div>
    <button type="button" class="facebox-close js-facebox-close" aria-label="Close modal">
      <svg aria-hidden="true" class="octicon octicon-x" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48z"/></svg>
    </button>
  </div>
</div>

  </body>
</html>

