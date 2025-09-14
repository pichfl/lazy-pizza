import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';
import { on } from '@ember/modifier';

// https://www.seriouseats.com/jim-laheys-no-knead-pizza-dough-recipe
const FLOUR = 500;
const WATER = 350;
const YEAST = 1;
const SALT = 16;
const RAISE = 18;
const DEFAULT_PORTIONS = 4;

export default class CalculatorComponent extends Component {
  @tracked portion = 250;
  @tracked portions = DEFAULT_PORTIONS;
  @tracked raise = 18;

  get total() {
    return this.portion * this.portions;
  }

  get scale() {
    return this.total / (FLOUR + WATER + SALT + (YEAST / RAISE) * this.raise);
  }

  get flour() {
    return FLOUR * this.scale;
  }

  get water() {
    return WATER * this.scale;
  }

  get yeast() {
    return ((YEAST * RAISE) / this.raise) * this.scale;
  }

  get salt() {
    return SALT * this.scale;
  }

  round(value, precision = 1) {
    const decimals = Math.pow(10, precision);
    return Math.ceil(value * decimals) / decimals;
  }

  @action
  update(event) {
    event.preventDefault();

    for (const [name, value] of new FormData(event.target.form).entries()) {
      this[name] = Number(value);
    }
  }

  @action
  ignore(event) {
    event.preventDefault();
  }

  <template>
    <header>
      <h1 aria-label="Pizza Dough Calculator">🍕</h1>
      <p>
        Calculates ingredients based on
        <a
          href="https://www.seriouseats.com/jim-laheys-no-knead-pizza-dough-recipe"
          rel="noopener noreferrer"
        >Jim Lahey's No-Knead Pizza Dough</a>
        recipe for your preferred portion and pie&nbsp;sizes.
      </p>
    </header>

    <form {{on "change" this.update}} {{on "submit" this.ignore}}>
      <div>
        <label for="portion">Portion g</label>
        <input
          id="portion"
          name="portion"
          type="number"
          min="0"
          value={{this.portion}}
        />
      </div>

      <div>
        <label for="portions">Portions #</label>
        <input
          id="portions"
          name="portions"
          type="number"
          min="0"
          value={{this.portions}}
        />
      </div>

      <div>
        <label for="raise">Raise h*</label>
        <input
          id="raise"
          name="raise"
          type="number"
          min="2"
          value={{this.raise}}
        />
      </div>
    </form>

    <div>
      <main>
        <table class="out">
          <tbody>
            <tr>
              <th>Flour</th>
              <td>{{this.round this.flour 0}} g</td>
            </tr>
            <tr>
              <th>Water</th>
              <td>{{this.round this.water 0}} g</td>
            </tr>
            <tr>
              <th>Yeast</th>
              <td>{{this.round this.yeast}} g</td>
            </tr>
            <tr>
              <th>Salt</th>
              <td>{{this.round this.salt}} g</td>
            </tr>
          </tbody>
        </table>
      </main>

      <aside>
        <p>
          <small>
            *: Changing the raise below 18 hours is possible but really
            not&nbsp;recommended.
          </small>
        </p>
      </aside>
    </div>
  </template>
}
