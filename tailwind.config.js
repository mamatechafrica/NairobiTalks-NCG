/** @type {import('tailwindcss').Config} */
module.exports = {
  darkMode: 'class',
  content: [
    './app/views/**/*.erb',
    './app/helpers/**/*.rb',
    './app/assets/javascripts/**/*.js',
    './app/javascript/**/*.js',
    './app/components/**/*.erb',
    './app/components/**/*.rb',
    './app/assets/stylesheets/**/*.css',
  ],
  safelist: [
    'tabs', 'tabs-lifted', 'tab', 'tab-content',
    'btn', 'btn-primary', 'btn-success', 'btn-outline', 'btn-ghost', 'btn-error', 'btn-info',
    'btn-sm', 'btn-lg', 'w-full',
    'alert', 'alert-error',
    'card', 'card-body',
    'input', 'input-bordered', 'input-lg',
    'textarea', 'textarea-bordered',
    'select', 'select-bordered',
    'label', 'label-text',
    'checkbox', 'toggle',
    'form-control', 'form-label'
  ],
  theme: {
    extend: {
      colors: {
        primary: {
          DEFAULT: 'var(--color-primary)', // green-700
          foreground: 'var(--color-primary-foreground)' // white
        },
        secondary: {
          DEFAULT: 'var(--color-secondary)', // green-500
          foreground: 'var(--color-secondary-foreground)' // white
        },
        accent: {
          DEFAULT: 'var(--color-accent)', // blue-600
          foreground: 'var(--color-accent-foreground)' // white
        },
        background: 'var(--color-background)', // sage-50
        foreground: 'var(--color-foreground)', // gray-800
        card: {
          DEFAULT: 'var(--color-card)', // white
          foreground: 'var(--color-card-foreground)' // gray-800
        },
        popover: {
          DEFAULT: 'var(--color-popover)', // white
          foreground: 'var(--color-popover-foreground)' // gray-800
        },
        muted: {
          DEFAULT: 'var(--color-muted)', // gray-100
          foreground: 'var(--color-muted-foreground)' // gray-500
        },
        border: 'var(--color-border)', // primary/15%
        input: 'var(--color-input)', // white
        ring: 'var(--color-ring)', // green-700
        success: {
          DEFAULT: 'var(--color-success)', // emerald-500
          foreground: 'var(--color-success-foreground)' // white
        },
        warning: {
          DEFAULT: 'var(--color-warning)', // amber-500
          foreground: 'var(--color-warning-foreground)' // gray-800
        },
        error: {
          DEFAULT: 'var(--color-error)', // red-500
          foreground: 'var(--color-error-foreground)' // white
        },
        destructive: {
          DEFAULT: 'var(--color-destructive)', // red-500
          foreground: 'var(--color-destructive-foreground)' // white
        }
      },
      fontFamily: {
        heading: ['Outfit', 'sans-serif'],
        body: ['Source Sans 3', 'sans-serif'],
        caption: ['Inter', 'sans-serif'],
        data: ['JetBrains Mono', 'monospace']
      },
      borderRadius: {
        sm: '6px',
        DEFAULT: '12px',
        md: '12px',
        lg: '18px',
        xl: '24px'
      },
      spacing: {
        '6': '6px',
        '12': '12px',
        '18': '18px',
        '20': '20px',
        '24': '24px',
        '28': '28px',
        '32': '32px',
        '48': '48px',
        '64': '64px',
        '96': '96px'
      },
      boxShadow: {
        'elevation-0': 'none',
        'elevation-1': '0 1px 3px rgba(0, 0, 0, 0.08)',
        'elevation-2': '0 2px 6px rgba(0, 0, 0, 0.1)',
        'elevation-3': '0 6px 12px rgba(0, 0, 0, 0.12)',
        'elevation-4': '0 12px 24px rgba(0, 0, 0, 0.14)',
        'elevation-5': '0 20px 40px -8px rgba(0, 0, 0, 0.16)'
      },
      transitionTimingFunction: {
        'smooth': 'cubic-bezier(0.4, 0, 0.2, 1)',
        'spring': 'cubic-bezier(0.34, 1.56, 0.64, 1)'
      },
      transitionDuration: {
        'smooth': '250ms'
      },
      zIndex: {
        'base': '0',
        'card': '10',
        'sticky': '20',
        'dropdown': '100',
        'navigation': '200',
        'modal': '300',
        'toast': '400'
      },
      screens: {
        'xs': '480px',
        'sm': '640px',
        'md': '768px',
        'lg': '1024px',
        'xl': '1280px'
      }
    }
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('tailwindcss-animate'),
    require('daisyui')
  ]

  // DaisyUI config: provide a lightweight theme that maps to existing CSS variables
  ,
  daisyui: {
    themes: [
      {
        'nairobi': {
          'primary': '#16a34a',
          'primary-focus': '#15803d',
          'primary-content': '#ffffff',

          'secondary': '#10b981',
          'secondary-focus': '#059669',
          'secondary-content': '#ffffff',

          'accent': '#0ea5e9',
          'accent-focus': '#0284c7',
          'accent-content': '#ffffff',

          'neutral': '#f8fafc',
          'base-100': '#ffffff',
          'info': '#60a5fa',
          'success': '#10b981',
          'warning': '#f59e0b',
          'error': '#ef4444'
        }
      }
    ],
    darkTheme: "nairobi"
  }
}
