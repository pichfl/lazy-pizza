import { pageTitle } from 'ember-page-title';
import Calculator from '../components/calculator';

<template>
  {{pageTitle "🍕 The Laziest Pizza Dough Calculator"}}

  <Calculator />

  {{outlet}}

  <aside>
    <h2>FAQ</h2>
    <p>Or rather some side-notes about this project.</p>

    <dl>
      <dt>Is this Neapolitan pizza?</dt>
      <dd>Not according to the
        <a
          href="https://www.pizzanapoletana.org/en/ricetta_pizza_napoletana"
          rel="noopener noreferrer"
        >AVPN Regulations</a>. Close enough for me though.</dd>
      <dt>What flour should I use?</dt>
      <dd>Typo 00. You can make do with all-purpose flour but never cake flour
        (for Germans: Typ 550). A 50/50 mix of Caputo Pizzeria and Caputo Nuvola
        works well for me.</dd>
      <dt>Does this work in a home oven?</dt>
      <dd>With some care. It's a very soft dough with "high hydration". It is
        best suited for an oven that heats to more than 400 °C or at least a
        pizza steel or stone.</dd>
      <dt>Sauce?</dt>
      <dd>Following the theme of less work: Mutti pizza sauce works for me.</dd>
      <dt>Will you add x to this calculator</dt>
      <dd>Probably not.</dd>
    </dl>
  </aside>

  <footer>
    <p>
      Made to taste by
      <a href="https://florianpichler.de">Florian Pichler</a>. Enjoy your pizza!</p>
  </footer>
</template>
