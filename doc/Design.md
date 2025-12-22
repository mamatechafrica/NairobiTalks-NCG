# TAILWIND.CSS

@import url('<https://fonts.googleapis.com/css2?family=Outfit:wght@400;500;600;700&display=swap>');
@import url('<https://fonts.googleapis.com/css2?family=Source+Sans+3:wght@400;500&display=swap>');
@import url('<https://fonts.googleapis.com/css2?family=Inter:wght@400;500&display=swap>');
@import url('<https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@400;500&display=swap>');

@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
  :root {
    --color-primary: #009339; /*green-700 */
    --color-primary-foreground: #ffffff; /* white */
    --color-secondary: #3aa966; /* green-500 */
    --color-secondary-foreground: #ffffff; /* white */
    --color-accent: #2563eb; /* blue-600 */
    --color-accent-foreground: #ffffff; /* white */
    --color-background: #edf6f2; /* sage-50 */
    --color-foreground: #1f2937; /* gray-800 */
    --color-card: #ffffff; /* white */
    --color-card-foreground: #1f2937; /* gray-800 */
    --color-popover: #ffffff; /* white */
    --color-popover-foreground: #1f2937; /* gray-800 */
    --color-muted: #f3f4f6; /* gray-100 */
    --color-muted-foreground: #6b7280; /* gray-500 */
    --color-border: rgba(0, 147, 57, 0.15); /* primary/15% */
    --color-input: #ffffff; /* white */
    --color-ring: #009339; /* green-700 */
    --color-success: #10b981; /* emerald-500 */
    --color-success-foreground: #ffffff; /* white */
    --color-warning: #f59e0b; /* amber-500 */
    --color-warning-foreground: #1f2937; /* gray-800 */
    --color-error: #ef4444; /* red-500 */
    --color-error-foreground: #ffffff; /* white */
    --color-destructive: #ef4444; /* red-500 */
    --color-destructive-foreground: #ffffff; /* white*/

    --radius: 0.5rem;
  }

  .dark {
    --color-primary: #3aa966; /*green-500 - reduced saturation */
    --color-primary-foreground: #ffffff; /* white */
    --color-secondary: #4ade80; /* green-400 */
    --color-secondary-foreground: #0f172a; /* slate-900 */
    --color-accent: #3b82f6; /* blue-500 */
    --color-accent-foreground: #ffffff; /* white */
    --color-background: #0f172a; /* slate-900 */
    --color-foreground: #ebebeb; /* gray-100/92% */
    --color-card: #1e293b; /* slate-800 */
    --color-card-foreground: #ebebeb; /* gray-100/92% */
    --color-popover: #1e293b; /* slate-800 */
    --color-popover-foreground: #ebebeb; /* gray-100/92% */
    --color-muted: #334155; /* slate-700 */
    --color-muted-foreground: #94a3b8; /* slate-400 */
    --color-border: rgba(58, 169, 102, 0.15); /* primary/15% */
    --color-input: #1e293b; /* slate-800 */
    --color-ring: #3aa966; /* green-500 */
    --color-success: #10b981; /* emerald-500 */
    --color-success-foreground: #ffffff; /* white */
    --color-warning: #f59e0b; /* amber-500 */
    --color-warning-foreground: #0f172a; /* slate-900 */
    --color-error: #ef4444; /* red-500 */
    --color-error-foreground: #ffffff; /* white */
    --color-destructive: #ef4444; /* red-500 */
    --color-destructive-foreground: #ffffff; /* white*/
  }

* {
    @apply border-border;
  }

  body {
    @apply bg-background text-foreground;
    font-family: 'Source Sans 3', sans-serif;
    font-size: 16px;
    line-height: 1.6;
  }

  @media (max-width: 768px) {
    body {
      font-size: 15px;
      line-height: 1.65;
    }
  }

  h1, h2, h3, h4, h5, h6 {
    font-family: 'Outfit', sans-serif;
  }

  h1 {
    font-size: 2.25rem;
    line-height: 1.2;
  }

  h2 {
    font-size: 1.875rem;
    line-height: 1.25;
  }

  h3 {
    font-size: 1.5rem;
    line-height: 1.3;
  }

  h4 {
    font-size: 1.25rem;
    line-height: 1.4;
  }

  h5 {
    font-size: 1.125rem;
    line-height: 1.5;
  }

  .caption {
    font-family: 'Inter', sans-serif;
    font-size: 0.875rem;
    line-height: 1.4;
    letter-spacing: 0.025em;
  }

  .data-text {
    font-family: 'JetBrains Mono', monospace;
    font-feature-settings: 'tnum' on, 'lnum' on;
  }

  p {
    max-width: 70ch;
  }
}

@layer utilities {
  .transition-smooth {
    transition: all 250ms cubic-bezier(0.4, 0, 0.2, 1);
  }

  .transition-spring {
    transition: all 250ms cubic-bezier(0.34, 1.56, 0.64, 1);
  }

  .shadow-elevation-0 {
    box-shadow: none;
  }

  .shadow-elevation-1 {
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.08);
  }

  .shadow-elevation-2 {
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
  }

  .shadow-elevation-3 {
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.12);
  }

  .shadow-elevation-4 {
    box-shadow: 0 12px 24px rgba(0, 0, 0, 0.14);
  }

  .shadow-elevation-5 {
    box-shadow: 0 20px 40px -8px rgba(0, 0, 0, 0.16);
  }

  .focus-ring {
    outline: 3px solid var(--color-ring);
    outline-offset: 2px;
  }

  .scale-press {
    transform: scale(0.96);
  }

  .lift-hover {
    transform: translateY(-1px);
  }
}

# INDEX.CSS
body {
  margin: 0;
  padding: 0;
  font-family: Inter;
}

* {
  box-sizing: border-box;
  line-height: normal;
  font-family: inherit;
  margin: unset;
}

# ROUTES.JSX

import React from "react";
import { BrowserRouter, Routes as RouterRoutes, Route } from "react-router-dom";
import ScrollToTop from "components/ScrollToTop";
import ErrorBoundary from "components/ErrorBoundary";
import NotFound from "pages/NotFound";
import HomeSwipeDeck from './pages/home-swipe-deck';
import IdeaDetailView from './pages/idea-detail-view';
import IdeaSubmissionForm from './pages/idea-submission-form';
import IdeasExplorer from './pages/ideas-explorer';
import UserProfileDashboard from './pages/user-profile-dashboard';
import LandingPage from './pages/landing-page';

const Routes = () => {
  return (
    <BrowserRouter>
      <ErrorBoundary>
      <ScrollToTop />
      <RouterRoutes>
        {/* Define your route here */}
        <Route path="/" element={<LandingPage />} />
        <Route path="/landing-page" element={<LandingPage />} />
        <Route path="/home-swipe-deck" element={<HomeSwipeDeck />} />
        <Route path="/idea-detail-view" element={<IdeaDetailView />} />
        <Route path="/idea-submission-form" element={<IdeaSubmissionForm />} />
        <Route path="/ideas-explorer" element={<IdeasExplorer />} />
        <Route path="/user-profile-dashboard" element={<UserProfileDashboard />} />
        <Route path="*" element={<NotFound />} />
      </RouterRoutes>
      </ErrorBoundary>
    </BrowserRouter>
  );
};

export default Routes;

# ui

    # Button.jsx
import React from 'react';
import { Slot } from "@radix-ui/react-slot";
import { cva } from "class-variance-authority";
import { cn } from "../../utils/cn";
import Icon from '../AppIcon';

const buttonVariants = cva(
    "inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50",
    {
        variants: {
            variant: {
                default: "bg-primary text-primary-foreground hover:bg-primary/90",
                destructive: "bg-destructive text-destructive-foreground hover:bg-destructive/90",
                outline: "border border-input hover:bg-accent hover:text-accent-foreground",
                secondary: "bg-secondary text-secondary-foreground hover:bg-secondary/80",
                ghost: "hover:bg-accent hover:text-accent-foreground",
                link: "text-primary underline-offset-4 hover:underline",
                success: "bg-success text-success-foreground hover:bg-success/90",
                warning: "bg-warning text-warning-foreground hover:bg-warning/90",
                danger: "bg-error text-error-foreground hover:bg-error/90",
            },
            size: {
                default: "h-10 px-4 py-2",
                sm: "h-9 rounded-md px-3",
                lg: "h-11 rounded-md px-8",
                icon: "h-10 w-10",
                xs: "h-8 rounded-md px-2 text-xs",
                xl: "h-12 rounded-md px-10 text-base",
            },
        },
        defaultVariants: {
            variant: "default",
            size: "default",
        },
    }
);

const Button = React.forwardRef(({
    className,
    variant,
    size,
    asChild = false,
    children,
    loading = false,
    iconName = null,
    iconPosition = 'left',
    iconSize = null,
    fullWidth = false,
    disabled = false,
    ...props
}, ref) => {
    const Comp = asChild ? Slot : "button";

    // Icon size mapping based on button size
    const iconSizeMap = {
        xs: 12,
        sm: 14,
        default: 16,
        lg: 18,
        xl: 20,
        icon: 16,
    };

    const calculatedIconSize = iconSize || iconSizeMap?.[size] || 16;

    // Loading spinner
    const LoadingSpinner = () => (
        <svg className="animate-spin -ml-1 mr-2 h-4 w-4" fill="none" viewBox="0 0 24 24">
            <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" />
            <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 714 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z" />
        </svg>
    );

    const renderIcon = () => {
        if (!iconName) return null;
        try {
            return (
                <Icon
                    name={iconName}
                    size={calculatedIconSize}
                    className={cn(
                        children && iconPosition === 'left' && "mr-2",
                        children && iconPosition === 'right' && "ml-2"
                    )}
                />
            );
        } catch {
            return null;
        }
    };

    const renderFallbackButton = () => (
        <button
            className={cn(
                buttonVariants({ variant, size, className }),
                fullWidth && "w-full"
            )}
            ref={ref}
            disabled={disabled || loading}
            {...props}
        >
            {loading && <LoadingSpinner />}
            {iconName && iconPosition === 'left' && renderIcon()}
            {children}
            {iconName && iconPosition === 'right' && renderIcon()}
        </button>
    );

    // When asChild is true, merge icons into the child element
    if (asChild) {
        try {
            if (!children || React.Children?.count(children) !== 1) {
                return renderFallbackButton();
            }

            const child = React.Children?.only(children);

            if (!React.isValidElement(child)) {
                return renderFallbackButton();
            }
            const content = (
                <>
                    {loading && <LoadingSpinner />}
                    {iconName && iconPosition === 'left' && renderIcon()}
                    {child?.props?.children}
                    {iconName && iconPosition === 'right' && renderIcon()}
                </>
            );

            const clonedChild = React.cloneElement(child, {
                className: cn(
                    buttonVariants({ variant, size, className }),
                    fullWidth && "w-full",
                    child?.props?.className
                ),
                disabled: disabled || loading || child?.props?.disabled,
                children: content,
            });

            return <Comp ref={ref} {...props}>{clonedChild}</Comp>;
        } catch {
            return renderFallbackButton();
        }
    }

    return (
        <Comp
            className={cn(
                buttonVariants({ variant, size, className }),
                fullWidth && "w-full"
            )}
            ref={ref}
            disabled={disabled || loading}
            {...props}
        >
            {loading && <LoadingSpinner />}
            {iconName && iconPosition === 'left' && renderIcon()}
            {children}
            {iconName && iconPosition === 'right' && renderIcon()}
        </Comp>
    );
});

Button.displayName = "Button";
export default Button;

    # CardInteractionController.jsx
import React, { useState, useRef, useEffect } from 'react';
import Icon from '../AppIcon';

const CardInteractionController = ({
  cards = [],
  onSwipeLeft,
  onSwipeRight,
  onCardChange,
  currentIndex = 0
}) => {
  const [activeIndex, setActiveIndex] = useState(currentIndex);
  const [dragStart, setDragStart] = useState(null);
  const [dragOffset, setDragOffset] = useState({ x: 0, y: 0 });
  const [isDragging, setIsDragging] = useState(false);
  const cardRef = useRef(null);

  const SWIPE_THRESHOLD = 100;
  const ROTATION_FACTOR = 0.1;

  useEffect(() => {
    setActiveIndex(currentIndex);
  }, [currentIndex]);

  const handleDragStart = (clientX, clientY) => {
    setDragStart({ x: clientX, y: clientY });
    setIsDragging(true);
  };

  const handleDragMove = (clientX, clientY) => {
    if (!dragStart) return;

    const deltaX = clientX - dragStart?.x;
    const deltaY = clientY - dragStart?.y;
    setDragOffset({ x: deltaX, y: deltaY });
  };

  const handleDragEnd = () => {
    if (!dragStart) return;

    const swipeDistance = Math.abs(dragOffset?.x);
    
    if (swipeDistance > SWIPE_THRESHOLD) {
      if (dragOffset?.x > 0) {
        handleSwipeRight();
      } else {
        handleSwipeLeft();
      }
    }

    setDragStart(null);
    setDragOffset({ x: 0, y: 0 });
    setIsDragging(false);
  };

  const handleSwipeLeft = () => {
    if (activeIndex < cards?.length - 1) {
      const newIndex = activeIndex + 1;
      setActiveIndex(newIndex);
      onSwipeLeft?.(cards?.[activeIndex]);
      onCardChange?.(newIndex);
    }
    setDragOffset({ x: 0, y: 0 });
  };

  const handleSwipeRight = () => {
    if (activeIndex < cards?.length - 1) {
      const newIndex = activeIndex + 1;
      setActiveIndex(newIndex);
      onSwipeRight?.(cards?.[activeIndex]);
      onCardChange?.(newIndex);
    }
    setDragOffset({ x: 0, y: 0 });
  };

  const handleKeyDown = (e) => {
    if (e?.key === 'ArrowLeft') {
      handleSwipeLeft();
    } else if (e?.key === 'ArrowRight') {
      handleSwipeRight();
    }
  };

  useEffect(() => {
    window.addEventListener('keydown', handleKeyDown);
    return () => window.removeEventListener('keydown', handleKeyDown);
  }, [activeIndex, cards]);

  const rotation = dragOffset?.x *ROTATION_FACTOR;
  const opacity = 1 - Math.abs(dragOffset?.x) / (SWIPE_THRESHOLD* 2);

  return (
    <div className="relative w-full h-full flex items-center justify-center">
      <div
        ref={cardRef}
        className="relative w-full max-w-md lg:max-w-lg"
        onMouseDown={(e) => handleDragStart(e?.clientX, e?.clientY)}
        onMouseMove={(e) => isDragging && handleDragMove(e?.clientX, e?.clientY)}
        onMouseUp={handleDragEnd}
        onMouseLeave={handleDragEnd}
        onTouchStart={(e) => handleDragStart(e?.touches?.[0]?.clientX, e?.touches?.[0]?.clientY)}
        onTouchMove={(e) => isDragging && handleDragMove(e?.touches?.[0]?.clientX, e?.touches?.[0]?.clientY)}
        onTouchEnd={handleDragEnd}
        style={{
          transform: `translateX(${dragOffset?.x}px) translateY(${dragOffset?.y}px) rotate(${rotation}deg)`,
          opacity: isDragging ? opacity : 1,
          cursor: isDragging ? 'grabbing' : 'grab',
          transition: isDragging ? 'none' : 'transform 250ms cubic-bezier(0.4, 0, 0.2, 1), opacity 250ms cubic-bezier(0.4, 0, 0.2, 1)'
        }}
      >
        {cards?.[activeIndex] && (
          <div className="bg-card rounded-xl lg:rounded-2xl shadow-elevation-3 p-8 lg:p-12 border border-border">
            {cards?.[activeIndex]}
          </div>
        )}
      </div>
      {isDragging && Math.abs(dragOffset?.x) > SWIPE_THRESHOLD / 2 && (
        <div
          className={`
absolute top-1/2 -translate-y-1/2 px-6 py-3 rounded-lg
            font-heading font-semibold text-lg
            transition-smooth pointer-events-none
            ${dragOffset?.x > 0
              ? 'right-8 bg-success text-success-foreground'
              : 'left-8 bg-error text-error-foreground'
            }
          `}
        >
          {dragOffset?.x > 0 ? 'Support' : 'Pass'}
        </div>
      )}
      <div className="absolute bottom-8 left-1/2 -translate-x-1/2 flex items-center gap-6">
        <button
          onClick={handleSwipeLeft}
          className="w-14 h-14 lg:w-16 lg:h-16 rounded-full bg-error text-error-foreground shadow-elevation-2 flex items-center justify-center transition-smooth hover:shadow-elevation-3 hover:lift-hover active:scale-press"
          aria-label="Pass"
        >
          <Icon name="X" size={28} color="#ffffff" />
        </button>

        <div className="caption text-muted-foreground">
          {activeIndex + 1} / {cards?.length}
        </div>

        <button
          onClick={handleSwipeRight}
          className="w-14 h-14 lg:w-16 lg:h-16 rounded-full bg-success text-success-foreground shadow-elevation-2 flex items-center justify-center transition-smooth hover:shadow-elevation-3 hover:lift-hover active:scale-press"
          aria-label="Support"
        >
          <Icon name="Heart" size={28} color="#ffffff" />
        </button>
      </div>
      <div className="absolute top-8 right-8 caption text-muted-foreground hidden lg:block">
        <div className="flex items-center gap-2">
          <Icon name="ArrowLeft" size={16} />
          <span>Pass</span>
          <span className="mx-2">•</span>
          <span>Support</span>
          <Icon name="ArrowRight" size={16} />
        </div>
      </div>
    </div>
  );
};

export default CardInteractionController;

    # Checkbox.jsx
import React from "react";
import { Check, Minus } from "lucide-react";
import { cn } from "../../utils/cn";

const Checkbox = React.forwardRef(({
    className,
    id,
    checked,
    indeterminate = false,
    disabled = false,
    required = false,
    label,
    description,
    error,
    size = "default",
    ...props
}, ref) => {
    // Generate unique ID if not provided
    const checkboxId = id || `checkbox-${Math.random()?.toString(36)?.substr(2, 9)}`;

    // Size variants
    const sizeClasses = {
        sm: "h-4 w-4",
        default: "h-4 w-4",
        lg: "h-5 w-5"
    };

    return (
        <div className={cn("flex items-start space-x-2", className)}>
            <div className="relative flex items-center">
                <input
                    type="checkbox"
                    ref={ref}
                    id={checkboxId}
                    checked={checked}
                    disabled={disabled}
                    required={required}
                    className="sr-only"
                    {...props}
                />

                <label
                    htmlFor={checkboxId}
                    className={cn(
                        "peer shrink-0 rounded-sm border border-primary ring-offset-background focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 data-[state=checked]:bg-primary data-[state=checked]:text-primary-foreground cursor-pointer transition-colors",
                        sizeClasses?.[size],
                        checked && "bg-primary text-primary-foreground border-primary",
                        indeterminate && "bg-primary text-primary-foreground border-primary",
                        error && "border-destructive",
                        disabled && "cursor-not-allowed opacity-50"
                    )}
                >
                    {checked && !indeterminate && (
                        <Check className="h-3 w-3 text-current flex items-center justify-center" />
                    )}
                    {indeterminate && (
                        <Minus className="h-3 w-3 text-current flex items-center justify-center" />
                    )}
                </label>
            </div>
            {(label || description || error) && (
                <div className="flex-1 space-y-1">
                    {label && (
                        <label
                            htmlFor={checkboxId}
                            className={cn(
                                "text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70 cursor-pointer",
                                error ? "text-destructive" : "text-foreground"
                            )}
                        >
                            {label}
                            {required && <span className="text-destructive ml-1">*</span>}
                        </label>
                    )}

                    {description && !error && (
                        <p className="text-sm text-muted-foreground">
                            {description}
                        </p>
                    )}

                    {error && (
                        <p className="text-sm text-destructive">
                            {error}
                        </p>
                    )}
                </div>
            )}
        </div>
    );
});

Checkbox.displayName = "Checkbox";

// Checkbox Group component
const CheckboxGroup = React.forwardRef(({
    className,
    children,
    label,
    description,
    error,
    required = false,
    disabled = false,
    ...props
}, ref) => {
    return (
        <fieldset
            ref={ref}
            disabled={disabled}
            className={cn("space-y-3", className)}
            {...props}
        >
            {label && (
                <legend className={cn(
                    "text-sm font-medium",
                    error ? "text-destructive" : "text-foreground"
                )}>
                    {label}
                    {required && <span className="text-destructive ml-1">*</span>}
                </legend>
            )}

            {description && !error && (
                <p className="text-sm text-muted-foreground">
                    {description}
                </p>
            )}

            <div className="space-y-2">
                {children}
            </div>

            {error && (
                <p className="text-sm text-destructive">
                    {error}
                </p>
            )}
        </fieldset>
    );
});

CheckboxGroup.displayName = "CheckboxGroup";

export { Checkbox, CheckboxGroup };

    # DetailViewNavigation.jsx
import React from 'react';
import { useNavigate } from 'react-router-dom';
import Icon from '../AppIcon';

const DetailViewNavigation = ({ title = 'Idea Details', showBackButton = true }) => {
  const navigate = useNavigate();

  const handleBack = () => {
    navigate(-1);
  };

  return (
    <div className="bg-card border-b border-border">
      <div className="max-w-4xl mx-auto px-6 lg:px-12 py-6 lg:py-8">
        <div className="flex items-center gap-4">
          {showBackButton && (
            <button
              onClick={handleBack}
              className="w-10 h-10 lg:w-12 lg:h-12 rounded-lg bg-muted hover:bg-primary hover:text-primary-foreground flex items-center justify-center transition-smooth hover:lift-hover active:scale-press"
              aria-label="Go back"
            >
              <Icon name="ArrowLeft" size={24} />
            </button>
          )}

          <h1 className="font-heading font-semibold text-2xl lg:text-3xl text-foreground">
            {title}
          </h1>
        </div>
      </div>
    </div>
  );
};

export default DetailViewNavigation;

    # Header.jsx
import React from 'react';
import { Link, useLocation } from 'react-router-dom';
import Icon from '../AppIcon';

const Header = () => {
  const location = useLocation();

  const isActive = (path) => location?.pathname === path;

  return (
    <header className="fixed top-0 left-0 right-0 z-navigation bg-card shadow-elevation-2 transition-smooth">
      <div className="max-w-7xl mx-auto px-6 lg:px-12">
        <div className="flex items-center justify-between h-16 lg:h-20">
          <Link
            to="/home-swipe-deck"
            className="flex items-center gap-3 transition-smooth hover:opacity-80"
          >
            <div className="w-10 h-10 lg:w-12 lg:h-12 bg-primary rounded-lg flex items-center justify-center transition-smooth">
              <Icon name="Vote" size={24} color="#ffffff" />
            </div>
            <span className="font-heading font-semibold text-xl lg:text-2xl text-foreground">
              CivicSwipe
            </span>
          </Link>

          <nav className="flex items-center gap-2 lg:gap-4">
            <Link
              to="/home-swipe-deck"
              className={`
                flex items-center gap-2 px-4 lg:px-6 h-10 lg:h-12 rounded-lg
                font-body font-medium text-sm lg:text-base
                transition-smooth
                ${isActive('/home-swipe-deck')
                  ? 'bg-primary text-primary-foreground shadow-elevation-1' :'text-foreground hover:bg-muted hover:lift-hover'
                }
              `}
            >
              <Icon 
                name="Home" 
                size={20} 
                color={isActive('/home-swipe-deck') ? '#ffffff' : 'currentColor'} 
              />
              <span className="hidden sm:inline">Discover</span>
            </Link>

            <Link
              to="/ideas-explorer"
              className={`
                flex items-center gap-2 px-4 lg:px-6 h-10 lg:h-12 rounded-lg
                font-body font-medium text-sm lg:text-base
                transition-smooth
                ${isActive('/ideas-explorer')
                  ? 'bg-primary text-primary-foreground shadow-elevation-1' :'text-foreground hover:bg-muted hover:lift-hover'
                }
              `}
            >
              <Icon 
                name="Search" 
                size={20} 
                color={isActive('/ideas-explorer') ? '#ffffff' : 'currentColor'} 
              />
              <span className="hidden sm:inline">Explore</span>
            </Link>

            <Link
              to="/idea-submission-form"
              className={`
                flex items-center gap-2 px-4 lg:px-6 h-10 lg:h-12 rounded-lg
                font-body font-medium text-sm lg:text-base
                transition-smooth
                ${isActive('/idea-submission-form')
                  ? 'bg-primary text-primary-foreground shadow-elevation-1' :'text-foreground hover:bg-muted hover:lift-hover'
                }
              `}
            >
              <Icon 
                name="Plus" 
                size={20} 
                color={isActive('/idea-submission-form') ? '#ffffff' : 'currentColor'} 
              />
              <span className="hidden sm:inline">Submit</span>
            </Link>

            <Link
              to="/user-profile-dashboard"
              className={`
                flex items-center gap-2 px-4 lg:px-6 h-10 lg:h-12 rounded-lg
                font-body font-medium text-sm lg:text-base
                transition-smooth
                ${isActive('/user-profile-dashboard')
                  ? 'bg-primary text-primary-foreground shadow-elevation-1' :'text-foreground hover:bg-muted hover:lift-hover'
                }
              `}
            >
              <Icon 
                name="User" 
                size={20} 
                color={isActive('/user-profile-dashboard') ? '#ffffff' : 'currentColor'} 
              />
              <span className="hidden sm:inline">Profile</span>
            </Link>
          </nav>
        </div>
      </div>
    </header>
  );
};

export default Header;

    # Input.jsx
import React from "react";
import { cn } from "../../utils/cn";

const Input = React.forwardRef(({
    className,
    type = "text",
    label,
    description,
    error,
    required = false,
    id,
    ...props
}, ref) => {
    // Generate unique ID if not provided
    const inputId = id || `input-${Math.random()?.toString(36)?.substr(2, 9)}`;

    // Base input classes
    const baseInputClasses = "flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50";

    // Checkbox-specific styles
    if (type === "checkbox") {
        return (
            <input
                type="checkbox"
                className={cn(
                    "h-4 w-4 rounded border border-input bg-background text-primary focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50",
                    className
                )}
                ref={ref}
                id={inputId}
                {...props}
            />
        );
    }

    // Radio button-specific styles
    if (type === "radio") {
        return (
            <input
                type="radio"
                className={cn(
                    "h-4 w-4 rounded-full border border-input bg-background text-primary focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50",
                    className
                )}
                ref={ref}
                id={inputId}
                {...props}
            />
        );
    }

    // For regular inputs with wrapper structure
    return (
        <div className="space-y-2">
            {label && (
                <label
                    htmlFor={inputId}
                    className={cn(
                        "text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70",
                        error ? "text-destructive" : "text-foreground"
                    )}
                >
                    {label}
                    {required && <span className="text-destructive ml-1">*</span>}
                </label>
            )}

            <input
                type={type}
                className={cn(
                    baseInputClasses,
                    error && "border-destructive focus-visible:ring-destructive",
                    className
                )}
                ref={ref}
                id={inputId}
                {...props}
            />

            {description && !error && (
                <p className="text-sm text-muted-foreground">
                    {description}
                </p>
            )}

            {error && (
                <p className="text-sm text-destructive">
                    {error}
                </p>
            )}
        </div>
    );
});

Input.displayName = "Input";

export default Input;

    # Select.jsx
// components/ui/Select.jsx - Shadcn style Select
import React, { useState } from "react";
import { ChevronDown, Check, Search, X } from "lucide-react";
import { cn } from "../../utils/cn";
import Button from "./Button";
import Input from "./Input";

const Select = React.forwardRef(({
    className,
    options = [],
    value,
    defaultValue,
    placeholder = "Select an option",
    multiple = false,
    disabled = false,
    required = false,
    label,
    description,
    error,
    searchable = false,
    clearable = false,
    loading = false,
    id,
    name,
    onChange,
    onOpenChange,
    ...props
}, ref) => {
    const [isOpen, setIsOpen] = useState(false);
    const [searchTerm, setSearchTerm] = useState("");

    // Generate unique ID if not provided
    const selectId = id || `select-${Math.random()?.toString(36)?.substr(2, 9)}`;

    // Filter options based on search
    const filteredOptions = searchable && searchTerm
        ? options?.filter(option =>
            option?.label?.toLowerCase()?.includes(searchTerm?.toLowerCase()) ||
            (option?.value && option?.value?.toString()?.toLowerCase()?.includes(searchTerm?.toLowerCase()))
        )
        : options;

    // Get selected option(s) for display
    const getSelectedDisplay = () => {
        if (!value) return placeholder;

        if (multiple) {
            const selectedOptions = options?.filter(opt => value?.includes(opt?.value));
            if (selectedOptions?.length === 0) return placeholder;
            if (selectedOptions?.length === 1) return selectedOptions?.[0]?.label;
            return `${selectedOptions?.length} items selected`;
        }

        const selectedOption = options?.find(opt => opt?.value === value);
        return selectedOption ? selectedOption?.label : placeholder;
    };

    const handleToggle = () => {
        if (!disabled) {
            const newIsOpen = !isOpen;
            setIsOpen(newIsOpen);
            onOpenChange?.(newIsOpen);
            if (!newIsOpen) {
                setSearchTerm("");
            }
        }
    };

    const handleOptionSelect = (option) => {
        if (multiple) {
            const newValue = value || [];
            const updatedValue = newValue?.includes(option?.value)
                ? newValue?.filter(v => v !== option?.value)
                : [...newValue, option?.value];
            onChange?.(updatedValue);
        } else {
            onChange?.(option?.value);
            setIsOpen(false);
            onOpenChange?.(false);
        }
    };

    const handleClear = (e) => {
        e?.stopPropagation();
        onChange?.(multiple ? [] : '');
    };

    const handleSearchChange = (e) => {
        setSearchTerm(e?.target?.value);
    };

    const isSelected = (optionValue) => {
        if (multiple) {
            return value?.includes(optionValue) || false;
        }
        return value === optionValue;
    };

    const hasValue = multiple ? value?.length > 0 : value !== undefined && value !== '';

    return (
        <div className={cn("relative", className)}>
            {label && (
                <label
                    htmlFor={selectId}
                    className={cn(
                        "text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70 mb-2 block",
                        error ? "text-destructive" : "text-foreground"
                    )}
                >
                    {label}
                    {required && <span className="text-destructive ml-1">*</span>}
                </label>
            )}
            <div className="relative">
                <button
                    ref={ref}
                    id={selectId}
                    type="button"
                    className={cn(
                        "flex h-10 w-full items-center justify-between rounded-md border border-input bg-white text-black px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50",
                        error && "border-destructive focus:ring-destructive",
                        !hasValue && "text-muted-foreground"
                    )}
                    onClick={handleToggle}
                    disabled={disabled}
                    aria-expanded={isOpen}
                    aria-haspopup="listbox"
                    {...props}
                >
                    <span className="truncate">{getSelectedDisplay()}</span>

                    <div className="flex items-center gap-1">
                        {loading && (
                            <svg className="animate-spin h-4 w-4" viewBox="0 0 24 24">
                                <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" fill="none" />
                                <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z" />
                            </svg>
                        )}

                        {clearable && hasValue && !loading && (
                            <Button
                                variant="ghost"
                                size="icon"
                                className="h-4 w-4"
                                onClick={handleClear}
                            >
                                <X className="h-3 w-3" />
                            </Button>
                        )}

                        <ChevronDown className={cn("h-4 w-4 transition-transform", isOpen && "rotate-180")} />
                    </div>
                </button>

                {/* Hidden native select for form submission */}
                <select
                    name={name}
                    value={value || ''}
                    onChange={() => { }} // Controlled by our custom logic
                    className="sr-only"
                    tabIndex={-1}
                    multiple={multiple}
                    required={required}
                >
                    <option value="">Select...</option>
                    {options?.map(option => (
                        <option key={option?.value} value={option?.value}>
                            {option?.label}
                        </option>
                    ))}
                </select>

                {/* Dropdown */}
                {isOpen && (
                    <div className="absolute z-50 w-full mt-1 bg-white text-black border border-border rounded-md shadow-md">
                        {searchable && (
                            <div className="p-2 border-b">
                                <div className="relative">
                                    <Search className="absolute left-2 top-2.5 h-4 w-4 text-muted-foreground" />
                                    <Input
                                        placeholder="Search options..."
                                        value={searchTerm}
                                        onChange={handleSearchChange}
                                        className="pl-8"
                                    />
                                </div>
                            </div>
                        )}

                        <div className="py-1 max-h-60 overflow-auto">
                            {filteredOptions?.length === 0 ? (
                                <div className="px-3 py-2 text-sm text-muted-foreground">
                                    {searchTerm ? 'No options found' : 'No options available'}
                                </div>
                            ) : (
                                filteredOptions?.map((option) => (
                                    <div
                                        key={option?.value}
                                        className={cn(
                                            "relative flex cursor-pointer select-none items-center rounded-sm px-3 py-2 text-sm outline-none hover:bg-accent hover:text-accent-foreground",
                                            isSelected(option?.value) && "bg-primary text-primary-foreground",
                                            option?.disabled && "pointer-events-none opacity-50"
                                        )}
                                        onClick={() => !option?.disabled && handleOptionSelect(option)}
                                    >
                                        <span className="flex-1">{option?.label}</span>
                                        {multiple && isSelected(option?.value) && (
                                            <Check className="h-4 w-4" />
                                        )}
                                        {option?.description && (
                                            <span className="text-xs text-muted-foreground ml-2">
                                                {option?.description}
                                            </span>
                                        )}
                                    </div>
                                ))
                            )}
                        </div>
                    </div>
                )}
            </div>
            {description && !error && (
                <p className="text-sm text-muted-foreground mt-1">
                    {description}
                </p>
            )}
            {error && (
                <p className="text-sm text-destructive mt-1">
                    {error}
                </p>
            )}
        </div>
    );
});

Select.displayName = "Select";

export default Select;

    # AppIcon.jsx
import React from 'react';
import * as LucideIcons from 'lucide-react';
import { HelpCircle } from 'lucide-react';

function Icon({
    name,
    size = 24,
    color = "currentColor",
    className = "",
    strokeWidth = 2,
    ...props
}) {
    const IconComponent = LucideIcons?.[name];

    if (!IconComponent) {
        return <HelpCircle size={size} color="gray" strokeWidth={strokeWidth} className={className} {...props} />;
    }

    return <IconComponent
        size={size}
        color={color}
        strokeWidth={strokeWidth}
        className={className}
        {...props}
    />;
}
export default Icon;

    # AppImage.jsx
import React from 'react';

function Image({
  src,
  alt = "Image Name",
  className = "",
  ...props
}) {

  return (
    <img
      src={src}
      alt={alt}
      className={className}
      onError={(e) => {
        e.target.src = "/assets/images/no_image.png"
      }}
      {...props}
    />
  );
}

export default Image;

    # ErrorBoundary.jsx
import React from "react";
import Icon from "./AppIcon";

class ErrorBoundary extends React.Component {
  constructor(props) {
    super(props);
    this.state = { hasError: false };
  }

  static getDerivedStateFromError(error) {
    return { hasError: true };
  }

  componentDidCatch(error, errorInfo) {
    error.__ErrorBoundary = true;
    window.__COMPONENT_ERROR__?.(error, errorInfo);
    // console.log("Error caught by ErrorBoundary:", error, errorInfo);
  }

  render() {
    if (this.state?.hasError) {
      return (
        <div className="min-h-screen flex items-center justify-center bg-neutral-50">
          <div className="text-center p-8 max-w-md">
            <div className="flex justify-center items-center mb-2">
              <svg xmlns="http://www.w3.org/2000/svg" width="42px" height="42px" viewBox="0 0 32 33" fill="none">
                <path d="M16 28.5C22.6274 28.5 28 23.1274 28 16.5C28 9.87258 22.6274 4.5 16 4.5C9.37258 4.5 4 9.87258 4 16.5C4 23.1274 9.37258 28.5 16 28.5Z" stroke="#343330" strokeWidth="2" strokeMiterlimit="10" />
                <path d="M11.5 15.5C12.3284 15.5 13 14.8284 13 14C13 13.1716 12.3284 12.5 11.5 12.5C10.6716 12.5 10 13.1716 10 14C10 14.8284 10.6716 15.5 11.5 15.5Z" fill="#343330" />
                <path d="M20.5 15.5C21.3284 15.5 22 14.8284 22 14C22 13.1716 21.3284 12.5 20.5 12.5C19.6716 12.5 19 13.1716 19 14C19 14.8284 19.6716 15.5 20.5 15.5Z" fill="#343330" />
                <path d="M21 22.5C19.9625 20.7062 18.2213 19.5 16 19.5C13.7787 19.5 12.0375 20.7062 11 22.5" stroke="#343330" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" />
              </svg>
            </div>
            <div className="flex flex-col gap-1 text-center">
              <h1 className="text-2xl font-medium text-neutral-800">Something went wrong</h1>
              <p className="text-neutral-600 text-base w w-8/12 mx-auto">We encountered an unexpected error while processing your request.</p>
            </div>
            <div className="flex justify-center items-center mt-6">
              <button
                onClick={() => {
                  window.location.href = "/";
                }}
                className="bg-blue-500 hover:bg-blue-600 text-white font-medium py-2 px-4 rounded flex items-center gap-2 transition-colors duration-200 shadow-sm"
              >
                <Icon name="ArrowLeft" size={18} color="#fff" />
                Back
              </button>
            </div>
          </div >
        </div >
      );
    }

    return this.props?.children;
  }
}

export default ErrorBoundary;

    # ScrollToTop.jsx
import { useEffect } from "react";
import { useLocation } from "react-router-dom";

const ScrollToTop = () => {
  const { pathname } = useLocation();

  useEffect(() => {
    window.scrollTo(0, 0);
  }, [pathname]);

  return null;
};

export default ScrollToTop;

# pages

    # home-swipe-deck
        components

        # EmptyState.jsx
import React from 'react';
import Icon from '../../../components/AppIcon';
import Button from '../../../components/ui/Button';

const EmptyState = ({ onRefresh }) => {
  return (
    <div className="flex flex-col items-center justify-center min-h-[60vh] px-6">
      <div className="w-20 h-20 lg:w-24 lg:h-24 rounded-full bg-primary/10 flex items-center justify-center mb-6">
        <Icon name="CheckCircle2" size={48} color="var(--color-primary)" />
      </div>

      <h2 className="font-heading font-semibold text-2xl lg:text-3xl text-foreground mb-3 text-center">
        You've Reviewed All Ideas!
      </h2>

      <p className="font-body text-base lg:text-lg text-muted-foreground mb-8 text-center max-w-md">
        Great job engaging with your community. Check back later for new ideas or submit your own.
      </p>

      <Button
        variant="default"
        size="lg"
        iconName="RefreshCw"
        iconPosition="left"
        onClick={onRefresh}
      >
        Load More Ideas
      </Button>
    </div>
  );
};

export default EmptyState;

        # IdeaCard.jsx

import React from 'react';
import Icon from '../../../components/AppIcon';
import Image from '../../../components/AppImage';

const IdeaCard = ({ idea, onDetailClick }) => {
  return (
    <div className="bg-card rounded-xl lg:rounded-2xl shadow-elevation-3 overflow-hidden border border-border transition-smooth hover:shadow-elevation-4">
      {idea?.image && (
        <div className="w-full h-48 md:h-56 lg:h-64 overflow-hidden">
          <Image
            src={idea?.image}
            alt={idea?.imageAlt}
            className="w-full h-full object-cover"
          />
        </div>
      )}
      <div className="p-6 md:p-8 lg:p-10">
        <div className="flex items-start justify-between gap-4 mb-4">
          <div className="flex items-center gap-2">
            <div className="w-10 h-10 lg:w-12 lg:h-12 rounded-full bg-primary/10 flex items-center justify-center">
              <Icon name="Lightbulb" size={20} color="var(--color-primary)" />
            </div>
            <div className="px-3 py-1 rounded-full bg-primary/10 border border-primary/20">
              <span className="caption text-primary font-medium">{idea?.ward}</span>
            </div>
          </div>
        </div>

        <h2 className="font-heading font-semibold text-xl md:text-2xl lg:text-3xl text-foreground mb-3 lg:mb-4 line-clamp-2">
          {idea?.title}
        </h2>

        <p className="font-body text-sm md:text-base lg:text-lg text-muted-foreground mb-4 lg:mb-6 line-clamp-3">
          {idea?.description}
        </p>

        <div className="flex flex-wrap gap-2 mb-6">
          {idea?.topics?.map((topic, index) => (
            <span
              key={index}
              className="px-3 py-1.5 rounded-lg bg-secondary/10 border border-secondary/20 caption text-secondary font-medium"
            >
              {topic}
            </span>
          ))}
        </div>

        <div className="flex items-center justify-between pt-4 border-t border-border">
          <div className="flex items-center gap-6">
            <div className="flex items-center gap-2">
              <Icon name="ThumbsUp" size={20} color="var(--color-success)" />
              <span className="data-text text-base md:text-lg font-medium text-foreground">
                {idea?.upvotes}
              </span>
            </div>
            <div className="flex items-center gap-2">
              <Icon name="ThumbsDown" size={20} color="var(--color-muted-foreground)" />
              <span className="data-text text-base md:text-lg font-medium text-foreground">
                {idea?.downvotes}
              </span>
            </div>
          </div>

          <button
            onClick={() => onDetailClick(idea)}
            className="flex items-center gap-2 px-4 py-2 rounded-lg bg-muted hover:bg-primary hover:text-primary-foreground transition-smooth hover:lift-hover active:scale-press"
            aria-label="View idea details"
          >
            <span className="caption font-medium hidden sm:inline">Details</span>
            <Icon name="ChevronRight" size={20} />
          </button>
        </div>
      </div>
    </div>
  );
};

export default IdeaCard;

        # NavigationHints.jsx
import React from 'react';
import Icon from '../../../components/AppIcon';

const NavigationHints = () => {
  return (
    <div className="fixed bottom-8 left-1/2 -translate-x-1/2 z-20">
      <div className="bg-card/95 backdrop-blur-sm rounded-xl shadow-elevation-3 px-6 py-4 border border-border">
        <div className="flex items-center gap-6">
          <div className="flex items-center gap-2">
            <div className="w-8 h-8 rounded-lg bg-error/10 flex items-center justify-center">
              <Icon name="ArrowLeft" size={16} color="var(--color-error)" />
            </div>
            <span className="caption text-foreground font-medium">Pass</span>
          </div>

          <div className="w-px h-6 bg-border" />

          <div className="flex items-center gap-2">
            <span className="caption text-foreground font-medium">Support</span>
            <div className="w-8 h-8 rounded-lg bg-success/10 flex items-center justify-center">
              <Icon name="ArrowRight" size={16} color="var(--color-success)" />
            </div>
          </div>
        </div>

        <div className="mt-3 pt-3 border-t border-border hidden lg:block">
          <p className="caption text-muted-foreground text-center">
            Use arrow keys or swipe to vote
          </p>
        </div>
      </div>
    </div>
  );
};

export default NavigationHints;

        # SwipeOverlay.jsx
import React from 'react';

const SwipeOverlay = ({ type, visible }) => {
  if (!visible) return null;

  const isLike = type === 'like';
  
  return (
    <div
      className={`
absolute inset-0 flex items-center justify-center pointer-events-none z-10
        transition-smooth
      `}
      style={{
        transform: isLike ? 'rotate(12deg)' : 'rotate(-12deg)',
        opacity: visible ? 1 : 0
      }}
    >
      <div
        className={`
px-8 py-4 lg:px-12 lg:py-6 rounded-2xl border-4
          font-heading font-bold text-4xl lg:text-6xl
          ${isLike
            ? 'bg-success/20 border-success text-success' :'bg-error/20 border-error text-error'
          }
        `}
      >
        {isLike ? 'LIKE' : 'NOPE'}
      </div>
    </div>
  );
};

export default SwipeOverlay;

    # index.jsx
import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import Header from '../../components/ui/Header';
import CardInteractionController from '../../components/ui/CardInteractionController';
import IdeaCard from './components/IdeaCard';
import SwipeOverlay from './components/SwipeOverlay';
import NavigationHints from './components/NavigationHints';
import EmptyState from './components/EmptyState';

const HomeSwipeDeck = () => {
  const navigate = useNavigate();
  const [currentIndex, setCurrentIndex] = useState(0);
  const [swipeDirection, setSwipeDirection] = useState(null);
  const [votedIdeas, setVotedIdeas] = useState([]);

  const communityIdeas = [
  {
    id: 1,
    title: "Community Garden Initiative",
    description: "Transform the vacant lot on Maple Street into a thriving community garden where residents can grow fresh vegetables, herbs, and flowers. This space will promote sustainable living, provide educational opportunities for children, and create a gathering place for neighbors to connect and share gardening knowledge.",
    ward: "Ward 3",
    topics: ["Environment", "Community"],
    upvotes: 142,
    downvotes: 23,
    image: "https://img.rocket.new/generatedImages/rocket_gen_img_15f18d045-1764666615393.png",
    imageAlt: "Vibrant community garden with raised wooden beds filled with green vegetables and colorful flowers, people working together in sunny outdoor setting"
  },
  {
    id: 2,
    title: "Free Public WiFi Zones",
    description: "Install high-speed public WiFi access points in all major parks, libraries, and community centers throughout the city. This initiative will bridge the digital divide, support remote workers and students, and ensure all residents have equal access to online resources and opportunities regardless of their economic status.",
    ward: "Ward 1",
    topics: ["Technology", "Education"],
    upvotes: 287,
    downvotes: 45,
    image: "https://img.rocket.new/generatedImages/rocket_gen_img_190e975d8-1764821908241.png",
    imageAlt: "Modern public park with people using laptops and smartphones under trees, WiFi symbol overlay showing connectivity, bright daylight with urban skyline background"
  },
  {
    id: 3,
    title: "Bike Lane Expansion Project",
    description: "Create a comprehensive network of protected bike lanes connecting residential neighborhoods to downtown, schools, and shopping districts. This infrastructure improvement will reduce traffic congestion, lower carbon emissions, improve air quality, and provide safe transportation options for cyclists of all ages and skill levels.",
    ward: "Ward 5",
    topics: ["Transportation", "Environment"],
    upvotes: 198,
    downvotes: 67,
    image: "https://images.unsplash.com/photo-1728260390952-527e04661ce3",
    imageAlt: "Wide protected bike lane with green painted surface and white bicycle symbols, cyclists riding safely separated from car traffic by concrete barriers, tree-lined urban street"
  },
  {
    id: 4,
    title: "Monthly Farmers Market",
    description: "Establish a weekly farmers market in the downtown plaza featuring local farmers, artisans, and food vendors. This market will support local agriculture, provide access to fresh organic produce, create economic opportunities for small businesses, and foster community connections through shared cultural experiences and live entertainment.",
    ward: "Ward 2",
    topics: ["Economy", "Community", "Health"],
    upvotes: 321,
    downvotes: 34,
    image: "https://img.rocket.new/generatedImages/rocket_gen_img_1227712f7-1764915815373.png",
    imageAlt: "Bustling outdoor farmers market with colorful produce stands displaying fresh fruits and vegetables, vendors and customers interacting, white tents and morning sunlight"
  },
  {
    id: 5,
    title: "Youth Sports Complex",
    description: "Build a modern multi-sport facility with soccer fields, basketball courts, baseball diamonds, and a running track. This complex will provide safe recreational spaces for youth programs, reduce juvenile delinquency, promote physical fitness and healthy lifestyles, and host community sporting events that bring families together.",
    ward: "Ward 4",
    topics: ["Recreation", "Youth", "Health"],
    upvotes: 256,
    downvotes: 89,
    image: "https://img.rocket.new/generatedImages/rocket_gen_img_103b27222-1765060794116.png",
    imageAlt: "Modern outdoor sports complex with artificial turf soccer field, running track, basketball courts, and playground equipment, children playing sports with parents watching from bleachers"
  },
  {
    id: 6,
    title: "Senior Citizen Activity Center",
    description: "Renovate the old community center into a dedicated space for senior citizens featuring exercise classes, art workshops, computer training, social events, and health screenings. This center will combat social isolation among elderly residents, provide lifelong learning opportunities, and create an inclusive environment where seniors can maintain active and engaged lifestyles.",
    ward: "Ward 3",
    topics: ["Health", "Community", "Education"],
    upvotes: 189,
    downvotes: 28,
    image: "https://img.rocket.new/generatedImages/rocket_gen_img_15f39f3cc-1764654349660.png",
    imageAlt: "Bright community center interior with senior citizens participating in group exercise class, instructor leading stretching activities, large windows with natural light and colorful exercise mats"
  },
  {
    id: 7,
    title: "Public Art Installation Program",
    description: "Commission local artists to create murals, sculptures, and interactive art installations throughout the city to beautify public spaces and celebrate our diverse cultural heritage. This program will transform underutilized areas into vibrant destinations, support the local arts community, attract tourism, and give residents pride in their neighborhoods.",
    ward: "Ward 1",
    topics: ["Arts", "Community", "Tourism"],
    upvotes: 167,
    downvotes: 52,
    image: "https://images.unsplash.com/photo-1726501604970-654825da7e1f",
    imageAlt: "Large colorful street mural on brick building wall depicting community diversity and cultural symbols, artist on ladder painting details, people stopping to admire artwork"
  },
  {
    id: 8,
    title: "Zero Waste Initiative",
    description: "Implement a comprehensive recycling and composting program with educational campaigns, convenient drop-off locations, and incentives for waste reduction. This initiative will divert 75% of waste from landfills, reduce greenhouse gas emissions, create green jobs in waste management, and position our city as an environmental leader.",
    ward: "Ward 5",
    topics: ["Environment", "Education", "Economy"],
    upvotes: 234,
    downvotes: 71,
    image: "https://img.rocket.new/generatedImages/rocket_gen_img_184b5085b-1765154327034.png",
    imageAlt: "Modern recycling center with color-coded bins for different materials, residents sorting waste into blue green and brown containers, educational posters on walls showing recycling process"
  }];

  const [ideas, setIdeas] = useState(communityIdeas);

  useEffect(() => {
    const savedVotes = localStorage.getItem('civicswipe_voted_ideas');
    if (savedVotes) {
      setVotedIdeas(JSON.parse(savedVotes));
    }
  }, []);

  const handleSwipeLeft = (idea) => {
    setSwipeDirection('nope');
    setTimeout(() => {
      recordVote(idea?.id, 'pass');
      setSwipeDirection(null);
      setCurrentIndex((prev) => prev + 1);
    }, 300);
  };

  const handleSwipeRight = (idea) => {
    setSwipeDirection('like');
    setTimeout(() => {
      recordVote(idea?.id, 'support');
      setSwipeDirection(null);
      setCurrentIndex((prev) => prev + 1);
    }, 300);
  };

  const recordVote = (ideaId, voteType) => {
    const newVotedIdeas = [...votedIdeas, { id: ideaId, vote: voteType, timestamp: new Date()?.toISOString() }];
    setVotedIdeas(newVotedIdeas);
    localStorage.setItem('civicswipe_voted_ideas', JSON.stringify(newVotedIdeas));
  };

  const handleCardChange = (newIndex) => {
    setCurrentIndex(newIndex);
  };

  const handleDetailClick = (idea) => {
    navigate('/idea-detail-view', { state: { idea } });
  };

  const handleRefresh = () => {
    setCurrentIndex(0);
    setVotedIdeas([]);
    localStorage.removeItem('civicswipe_voted_ideas');
  };

  const remainingIdeas = ideas?.slice(currentIndex);

  return (
    <div className="min-h-screen bg-background">
      <Header />
      <main className="pt-20 lg:pt-24 pb-24 px-4 md:px-6 lg:px-8">
        <div className="max-w-7xl mx-auto">
          <div className="text-center mb-8 lg:mb-12">
            <h1 className="font-heading font-bold text-3xl md:text-4xl lg:text-5xl text-foreground mb-3 lg:mb-4">
              Explore Community Ideas
            </h1>
            <p className="font-body text-base md:text-lg lg:text-xl text-muted-foreground max-w-2xl mx-auto">
              Swipe right to support ideas you love, left to pass. Your voice shapes our community's future.
            </p>
          </div>

          {remainingIdeas?.length > 0 ?
          <div className="relative min-h-[600px] lg:min-h-[700px] flex items-center justify-center">
              <SwipeOverlay
              type={swipeDirection}
              visible={swipeDirection !== null} />

              
              <CardInteractionController
              cards={remainingIdeas?.map((idea) =>
              <IdeaCard
                key={idea?.id}
                idea={idea}
                onDetailClick={handleDetailClick} />

              )}
              onSwipeLeft={() => handleSwipeLeft(remainingIdeas[0])}
              onSwipeRight={() => handleSwipeRight(remainingIdeas[0])}
              onCardChange={handleCardChange}
              currentIndex={0} />

            </div> :

          <EmptyState onRefresh={handleRefresh} />
          }

          {remainingIdeas?.length > 0 && <NavigationHints />}

          <div className="mt-12 lg:mt-16 text-center">
            <div className="inline-flex items-center gap-3 px-6 py-3 rounded-xl bg-card border border-border shadow-elevation-1">
              <span className="caption text-muted-foreground">
                Ideas reviewed:
              </span>
              <span className="data-text text-lg font-semibold text-primary">
                {currentIndex} / {ideas?.length}
              </span>
            </div>
          </div>
        </div>
      </main>
    </div>);

};

export default HomeSwipeDeck;

    # idea-detail-view
        #components

        # CommentItem.jsx
import React from 'react';
import Icon from '../../../components/AppIcon';
import Image from '../../../components/AppImage';

const CommentItem = ({ comment }) => {
  const timeAgo = (date) => {
    const seconds = Math.floor((new Date() - new Date(date)) / 1000);

    let interval = seconds / 31536000;
    if (interval > 1) return Math.floor(interval) + ' years ago';
    
    interval = seconds / 2592000;
    if (interval > 1) return Math.floor(interval) + ' months ago';
    
    interval = seconds / 86400;
    if (interval > 1) return Math.floor(interval) + ' days ago';
    
    interval = seconds / 3600;
    if (interval > 1) return Math.floor(interval) + ' hours ago';
    
    interval = seconds / 60;
    if (interval > 1) return Math.floor(interval) + ' minutes ago';
    
    return Math.floor(seconds) + ' seconds ago';
  };

  return (
    <div className="flex gap-3 md:gap-4 p-4 md:p-5 bg-muted/30 rounded-lg lg:rounded-xl hover:bg-muted/50 transition-smooth">
      <div className="flex-shrink-0">
        <div className="w-10 h-10 md:w-12 md:h-12 rounded-full overflow-hidden bg-primary/10">
          {comment?.avatar ? (
            <Image
              src={comment?.avatar}
              alt={comment?.avatarAlt}
              className="w-full h-full object-cover"
            />
          ) : (
            <div className="w-full h-full flex items-center justify-center">
              <Icon name="User" size={20} color="var(--color-primary)" />
            </div>
          )}
        </div>
      </div>
      <div className="flex-1 min-w-0">
        <div className="flex flex-wrap items-center gap-2 mb-2">
          <span className="font-medium text-sm md:text-base text-foreground">
            {comment?.author}
          </span>
          <span className="caption text-muted-foreground">
            {timeAgo(comment?.timestamp)}
          </span>
        </div>

        <p className="text-sm md:text-base text-foreground/80 leading-relaxed whitespace-pre-line">
          {comment?.content}
        </p>

        <div className="flex items-center gap-4 mt-3">
          <button className="flex items-center gap-1.5 text-muted-foreground hover:text-primary transition-smooth caption">
            <Icon name="ThumbsUp" size={14} />
            <span>{comment?.likes}</span>
          </button>
          <button className="flex items-center gap-1.5 text-muted-foreground hover:text-primary transition-smooth caption">
            <Icon name="MessageCircle" size={14} />
            <span>Reply</span>
          </button>
        </div>
      </div>
    </div>
  );
};

export default CommentItem;

        # CommentsSection.jsx
import React, { useState } from 'react';
import Icon from '../../../components/AppIcon';
import Button from '../../../components/ui/Button';
import Input from '../../../components/ui/Input';
import CommentItem from './CommentItem';

const CommentsSection = ({ comments: initialComments }) => {
  const [comments, setComments] = useState(initialComments);
  const [newComment, setNewComment] = useState('');
  const [isSubmitting, setIsSubmitting] = useState(false);

  const handleSubmitComment = (e) => {
    e?.preventDefault();

    if (!newComment?.trim()) return;

    setIsSubmitting(true);

    setTimeout(() => {
      const comment = {
        id: Date.now(),
        author: 'You',
        avatar: "https://img.rocket.new/generatedImages/rocket_gen_img_19d0e83b5-1763298687249.png",
        avatarAlt: 'Profile photo of user with friendly smile wearing casual blue shirt',
        content: newComment,
        timestamp: new Date()?.toISOString(),
        likes: 0
      };

      setComments([comment, ...comments]);
      setNewComment('');
      setIsSubmitting(false);
    }, 500);
  };

  return (
    <div className="bg-card rounded-xl lg:rounded-2xl shadow-elevation-2 border border-border p-6 md:p-8">
      <div className="flex items-center justify-between mb-6 lg:mb-8">
        <h2 className="font-heading font-semibold text-xl md:text-2xl text-foreground">
          Community Discussion
        </h2>
        <span className="caption text-muted-foreground">
          {comments?.length} {comments?.length === 1 ? 'comment' : 'comments'}
        </span>
      </div>
      <form onSubmit={handleSubmitComment} className="mb-6 lg:mb-8">
        <Input
          type="text"
          label="Add your thoughts"
          placeholder="Share your perspective on this idea..."
          value={newComment}
          onChange={(e) => setNewComment(e?.target?.value)}
          className="mb-4" />

        <Button
          type="submit"
          variant="default"
          loading={isSubmitting}
          disabled={!newComment?.trim()}
          iconName="Send"
          iconPosition="right">

          Post Comment
        </Button>
      </form>
      <div className="space-y-4">
        {comments?.length === 0 ?
        <div className="text-center py-12">
            <div className="w-16 h-16 mx-auto mb-4 rounded-full bg-muted flex items-center justify-center">
              <Icon name="MessageCircle" size={32} color="var(--color-muted-foreground)" />
            </div>
            <p className="text-muted-foreground">
              No comments yet. Be the first to share your thoughts!
            </p>
          </div> :

        comments?.map((comment) =>
        <CommentItem key={comment?.id} comment={comment} />
        )
        }
      </div>
    </div>);

};

export default CommentsSection;

        # IdeaCard.jsx
import React from 'react';
import Icon from '../../../components/AppIcon';
import Image from '../../../components/AppImage';

const IdeaCard = ({ idea }) => {
  return (
    <div className="bg-card rounded-xl lg:rounded-2xl shadow-elevation-3 border border-border overflow-hidden">
      {idea?.image && (
        <div className="relative w-full h-48 md:h-56 lg:h-64 overflow-hidden">
          <Image
            src={idea?.image}
            alt={idea?.imageAlt}
            className="w-full h-full object-cover"
          />
        </div>
      )}
      <div className="p-6 md:p-8 lg:p-10">
        <div className="flex flex-wrap items-center gap-2 mb-4">
          <span className="inline-flex items-center gap-1.5 px-3 py-1.5 bg-primary/10 text-primary rounded-lg text-sm font-medium">
            <Icon name="MapPin" size={16} />
            {idea?.ward}
          </span>
          <span className="inline-flex items-center gap-1.5 px-3 py-1.5 bg-secondary/10 text-secondary rounded-lg text-sm font-medium">
            <Icon name="Tag" size={16} />
            {idea?.topic}
          </span>
        </div>

        <h1 className="font-heading font-bold text-2xl md:text-3xl lg:text-4xl text-foreground mb-4 lg:mb-6">
          {idea?.title}
        </h1>

        <p className="text-base md:text-lg text-foreground/80 leading-relaxed mb-6 lg:mb-8 whitespace-pre-line">
          {idea?.description}
        </p>

        <div className="flex items-center gap-4 pt-4 border-t border-border">
          <div className="flex items-center gap-2 text-muted-foreground caption">
            <Icon name="User" size={16} />
            <span>{idea?.isAnonymous ? 'Anonymous' : idea?.submittedBy}</span>
          </div>
          <div className="flex items-center gap-2 text-muted-foreground caption">
            <Icon name="Calendar" size={16} />
            <span>{new Date(idea.submittedDate)?.toLocaleDateString('en-US', { 
              month: 'short', 
              day: 'numeric', 
              year: 'numeric' 
            })}</span>
          </div>
        </div>
      </div>
    </div>
  );
};

export default IdeaCard;

        # VotingSection.jsx
import React, { useState } from 'react';

import Button from '../../../components/ui/Button';

const VotingSection = ({ initialUpvotes, initialDownvotes }) => {
  const [upvotes, setUpvotes] = useState(initialUpvotes);
  const [downvotes, setDownvotes] = useState(initialDownvotes);
  const [userVote, setUserVote] = useState(null);

  const handleUpvote = () => {
    if (userVote === 'up') {
      setUpvotes(upvotes - 1);
      setUserVote(null);
    } else {
      if (userVote === 'down') {
        setDownvotes(downvotes - 1);
      }
      setUpvotes(upvotes + 1);
      setUserVote('up');
    }
  };

  const handleDownvote = () => {
    if (userVote === 'down') {
      setDownvotes(downvotes - 1);
      setUserVote(null);
    } else {
      if (userVote === 'up') {
        setUpvotes(upvotes - 1);
      }
      setDownvotes(downvotes + 1);
      setUserVote('down');
    }
  };

  return (
    <div className="bg-card rounded-xl lg:rounded-2xl shadow-elevation-2 border border-border p-6 md:p-8">
      <h2 className="font-heading font-semibold text-xl md:text-2xl text-foreground mb-4 lg:mb-6">
        Community Feedback
      </h2>

      <div className="flex flex-col sm:flex-row items-stretch sm:items-center gap-4">
        <Button
          variant={userVote === 'up' ? 'success' : 'outline'}
          size="lg"
          fullWidth
          onClick={handleUpvote}
          iconName="ThumbsUp"
          iconPosition="left"
          className="flex-1"
        >
          <span className="flex items-center gap-2">
            Support
            <span className="data-text font-semibold">{upvotes}</span>
          </span>
        </Button>

        <Button
          variant={userVote === 'down' ? 'destructive' : 'outline'}
          size="lg"
          fullWidth
          onClick={handleDownvote}
          iconName="ThumbsDown"
          iconPosition="left"
          className="flex-1"
        >
          <span className="flex items-center gap-2">
            Pass
            <span className="data-text font-semibold">{downvotes}</span>
          </span>
        </Button>
      </div>

      <div className="mt-6 pt-6 border-t border-border">
        <div className="flex items-center justify-between text-sm md:text-base">
          <span className="text-muted-foreground">Total Votes</span>
          <span className="data-text font-semibold text-foreground">
            {upvotes + downvotes}
          </span>
        </div>
        <div className="mt-2 h-2 bg-muted rounded-full overflow-hidden">
          <div 
            className="h-full bg-success transition-smooth"
            style={{ 
              width: `${upvotes + downvotes > 0 ? (upvotes / (upvotes + downvotes)) * 100 : 0}%` 
            }}
          />
        </div>
      </div>
    </div>
  );
};

export default VotingSection;

    # index.jsx
import React from 'react';
import { Helmet } from 'react-helmet';
import Header from '../../components/ui/Header';
import DetailViewNavigation from '../../components/ui/DetailViewNavigation';
import IdeaCard from './components/IdeaCard';
import VotingSection from './components/VotingSection';
import CommentsSection from './components/CommentsSection';

const IdeaDetailView = () => {
  const ideaData = {
    id: 1,
    title: "Community Garden Initiative in Central Park",
    description: `I propose transforming the unused lot at Central Park into a vibrant community garden where residents can grow fresh vegetables, herbs, and flowers together.\n\nThis initiative would provide multiple benefits:\n• Access to fresh, organic produce for local families\n• Educational opportunities for children to learn about sustainable agriculture\n• A gathering space that strengthens neighborhood bonds\n• Reduction in food waste through composting programs\n• Beautification of currently underutilized public space\n\nThe garden could include raised beds, a tool shed, composting area, and seating spaces for community events. We could partner with local schools for educational programs and organize weekend workshops on gardening techniques.\n\nThis project would require initial funding for materials, ongoing volunteer coordination, and partnership with the Parks Department. I believe this investment would pay dividends in community health, environmental awareness, and social cohesion.`,
    ward: "Ward 3",
    topic: "Environment",
    image: "<https://img.rocket.new/generatedImages/rocket_gen_img_15f18d045-1764666615393.png>",
    imageAlt: "Lush community garden with raised wooden beds filled with green vegetables, colorful flowers, and people working together in sunny outdoor setting",
    submittedBy: "Sarah Martinez",
    submittedDate: "2025-12-15T10:30:00",
    isAnonymous: false,
    upvotes: 247,
    downvotes: 18
  };

  const commentsData = [
  {
    id: 1,
    author: "Michael Chen",
    avatar: "https://img.rocket.new/generatedImages/rocket_gen_img_1ed9501a6-1763292467465.png",
    avatarAlt: "Professional headshot of Asian man with short black hair wearing navy blue business suit and white shirt",
    content: "This is exactly what our neighborhood needs! I\'ve been wanting something like this for years. Would love to volunteer to help get this started.",
    timestamp: "2025-12-20T14:22:00",
    likes: 34
  },
  {
    id: 2,
    author: "Jennifer Williams",
    avatar: "https://images.unsplash.com/photo-1622672695118-a5bf841be9c5",
    avatarAlt: "Friendly portrait of African American woman with natural curly hair wearing green casual top with warm smile",
    content: "Great idea! As a teacher, I can see huge educational value here. Our school would definitely be interested in partnering for student field trips and learning activities.",
    timestamp: "2025-12-20T16:45:00",
    likes: 28
  },
  {
    id: 3,
    author: "Robert Thompson",
    avatar: "https://img.rocket.new/generatedImages/rocket_gen_img_1577af203-1764932649558.png",
    avatarAlt: "Mature Caucasian man with gray hair and beard wearing plaid flannel shirt in outdoor setting",
    content: "I have 20 years of gardening experience and would be happy to lead workshops. We should also consider water access and security for the tools and equipment.",
    timestamp: "2025-12-21T09:15:00",
    likes: 42
  },
  {
    id: 4,
    author: "Maria Rodriguez",
    avatar: "https://img.rocket.new/generatedImages/rocket_gen_img_1d7536c22-1763295143133.png",
    avatarAlt: "Young Hispanic woman with long dark hair wearing yellow summer dress with bright cheerful expression",
    content: "Love this proposal! My family would definitely participate. Can we include a section for native plants to support local pollinators?",
    timestamp: "2025-12-21T11:30:00",
    likes: 19
  },
  {
    id: 5,
    author: "David Park",
    avatar: "https://img.rocket.new/generatedImages/rocket_gen_img_126f71d00-1763294268914.png",
    avatarAlt: "Professional Asian man with glasses wearing gray business casual attire in office environment",
    content: "This could be a model for other wards too. Has anyone looked into grant funding from environmental organizations? I can help research potential funding sources.",
    timestamp: "2025-12-21T13:50:00",
    likes: 31
  }];

  return (
    <>
      <Helmet>
        <title>Community Garden Initiative - CivicSwipe</title>
        <meta name="description" content="View detailed information about community ideas and participate in local civic engagement discussions." />
      </Helmet>
      <div className="min-h-screen bg-background">
        <Header />

        <div className="pt-16 lg:pt-20">
          <DetailViewNavigation title="Idea Details" showBackButton={true} />
          
          <main className="max-w-4xl mx-auto px-4 md:px-6 lg:px-12 py-6 md:py-8 lg:py-12">
            <div className="space-y-6 md:space-y-8">
              <IdeaCard idea={ideaData} />
              
              <VotingSection
                initialUpvotes={ideaData?.upvotes}
                initialDownvotes={ideaData?.downvotes} />

              
              <CommentsSection initialComments={commentsData} />
            </div>
          </main>
        </div>
      </div>
    </>);

};

export default IdeaDetailView;

    # idea-submission-form
        # components

        # TagSelector.jsx
import React from 'react';
import { cn } from '../../../utils/cn';

const TagSelector = ({
  className,
  label,
  description,
  error,
  required = false,
  options = [],
  value = [],
  onChange,
  onBlur,
  maxSelections = null
}) => {
  const handleToggle = (optionId) => {
    const isSelected = value?.includes(optionId);

    if (isSelected) {
      // Remove from selection
      onChange?.(value?.filter(id => id !== optionId));
    } else {
      // Add to selection if under max limit
      if (!maxSelections || value?.length < maxSelections) {
        onChange?.([...value, optionId]);
      }
    }
  };

  const isSelected = (optionId) => value?.includes(optionId);
  const isDisabled = (optionId) => {
    return maxSelections && value?.length >= maxSelections && !isSelected(optionId);
  };

  return (
    <div className={cn("space-y-3", className)} onBlur={onBlur}>
      {label && (
        <label
          className={cn(
            "text-sm font-medium leading-none",
            error ? "text-destructive" : "text-foreground"
          )}
        >
          {label}
          {required && <span className="text-destructive ml-1">*</span>}
        </label>
      )}

      {description && !error && (
        <p className="text-sm text-muted-foreground">
          {description}
        </p>
      )}

      <div className="flex flex-wrap gap-2">
        {options?.map((option) => {
          const selected = isSelected(option?.id);
          const disabled = isDisabled(option?.id);

          return (
            <button
              key={option?.id}
              type="button"
              onClick={() => !disabled && handleToggle(option?.id)}
              disabled={disabled}
              className={cn(
                "px-4 py-2 rounded-full text-sm font-medium transition-all",
                "border-2 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2",
                selected && "bg-primary text-primary-foreground border-primary shadow-sm",
                !selected && !disabled && "bg-background text-foreground border-border hover:border-primary hover:bg-primary/10",
                disabled && "opacity-40 cursor-not-allowed"
              )}
            >
              {option?.label}
            </button>
          );
        })}
      </div>

      {maxSelections && (
        <p className="text-xs text-muted-foreground">
          {value?.length}/{maxSelections} selected
        </p>
      )}

      {error && (
        <p className="text-sm text-destructive">
          {error}
        </p>
      )}
    </div>
  );
};

export default TagSelector;

        # Textarea.jsx
import React from 'react';
import { cn } from '../../../utils/cn';

const Textarea = React.forwardRef(({
  className,
  label,
  description,
  error,
  required = false,
  id,
  rows = 4,
  ...props
}, ref) => {
  // Generate unique ID if not provided
  const textareaId = id || `textarea-${Math.random()?.toString(36)?.substr(2, 9)}`;

  return (
    <div className="space-y-2">
      {label && (
        <label
          htmlFor={textareaId}
          className={cn(
            "text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70",
            error ? "text-destructive" : "text-foreground"
          )}
        >
          {label}
          {required && <span className="text-destructive ml-1">*</span>}
        </label>
      )}

      <textarea
        ref={ref}
        id={textareaId}
        rows={rows}
        className={cn(
          "flex min-h-[80px] w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 resize-y",
          error && "border-destructive focus-visible:ring-destructive",
          className
        )}
        {...props}
      />

      {description && !error && (
        <p className="text-sm text-muted-foreground">
          {description}
        </p>
      )}

      {error && (
        <p className="text-sm text-destructive">
          {error}
        </p>
      )}
    </div>
  );
});

Textarea.displayName = 'Textarea';

export default Textarea;

    # index.jsx
import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import Header from '../../components/ui/Header';
import Input from '../../components/ui/Input';
import Button from '../../components/ui/Button';
import Select from '../../components/ui/Select';
import { Checkbox } from '../../components/ui/Checkbox';
import Textarea from '../idea-submission-form/components/Textarea';
import TagSelector from '../idea-submission-form/components/TagSelector';

const IdeaSubmissionForm = () => {
  const navigate = useNavigate();
  const [formData, setFormData] = useState({
    title: '',
    description: '',
    ward: '',
    topics: [],
    isAnonymous: false
  });

  const [errors, setErrors] = useState({});
  const [touched, setTouched] = useState({});
  const [isSubmitting, setIsSubmitting] = useState(false);

  // Ward options
  const wardOptions = [
    { value: 'ward-1', label: 'Ward 1' },
    { value: 'ward-2', label: 'Ward 2' },
    { value: 'ward-3', label: 'Ward 3' },
    { value: 'ward-4', label: 'Ward 4' },
    { value: 'ward-5', label: 'Ward 5' }
  ];

  // Topic options
  const topicOptions = [
    { id: 'environment', label: 'Environment' },
    { id: 'community', label: 'Community' },
    { id: 'technology', label: 'Technology' },
    { id: 'education', label: 'Education' },
    { id: 'transportation', label: 'Transportation' },
    { id: 'economy', label: 'Economy' },
    { id: 'health', label: 'Health' },
    { id: 'recreation', label: 'Recreation' },
    { id: 'youth', label: 'Youth' },
    { id: 'safety', label: 'Safety' }
  ];

  // Character limits
  const TITLE_MAX_LENGTH = 100;
  const DESCRIPTION_MAX_LENGTH = 500;

  // Validation
  const validateField = (name, value) => {
    switch (name) {
      case 'title':
        if (!value?.trim()) return 'Idea title is required';
        if (value?.length > TITLE_MAX_LENGTH) return `Title must be ${TITLE_MAX_LENGTH} characters or less`;
        return '';
      case 'description':
        if (!value?.trim()) return 'Description is required';
        if (value?.length < 20) return 'Description must be at least 20 characters';
        if (value?.length > DESCRIPTION_MAX_LENGTH) return `Description must be ${DESCRIPTION_MAX_LENGTH} characters or less`;
        return '';
      case 'ward':
        if (!value) return 'Please select a ward';
        return '';
      case 'topics':
        if (!value || value?.length === 0) return 'Please select at least one topic';
        if (value?.length > 3) return 'Please select up to 3 topics';
        return '';
      default:
        return '';
    }
  };

  const handleChange = (name, value) => {
    setFormData(prev => ({ ...prev, [name]: value }));

    // Clear error when user starts typing
    if (touched?.[name]) {
      const error = validateField(name, value);
      setErrors(prev => ({ ...prev, [name]: error }));
    }
  };

  const handleBlur = (name) => {
    setTouched(prev => ({ ...prev, [name]: true }));
    const error = validateField(name, formData?.[name]);
    setErrors(prev => ({ ...prev, [name]: error }));
  };

  const handleSubmit = async (e) => {
    e?.preventDefault();

    // Validate all fields
    const newErrors = {};
    Object.keys(formData)?.forEach(key => {
      if (key !== 'isAnonymous') {
        const error = validateField(key, formData?.[key]);
        if (error) newErrors[key] = error;
      }
    });

    setErrors(newErrors);
    setTouched({
      title: true,
      description: true,
      ward: true,
      topics: true
    });

    // If there are errors, don't submit
    if (Object.keys(newErrors)?.length > 0) {
      return;
    }

    setIsSubmitting(true);

    // Simulate API call
    setTimeout(() => {
      console.log('Form submitted:', formData);
      setIsSubmitting(false);
      // Navigate to home after successful submission
      navigate('/home-swipe-deck');
    }, 1500);
  };

  const handleCancel = () => {
    navigate(-1);
  };

  return (
    <div className="min-h-screen bg-background">
      <Header />

      <main className="pt-20 lg:pt-24 pb-12">
        <div className="max-w-3xl mx-auto px-6 lg:px-12">
          {/* Page Header */}
          <div className="mb-8">
            <h1 className="font-heading font-bold text-3xl lg:text-4xl text-foreground mb-2">
              Submit Your Idea
            </h1>
            <p className="text-muted-foreground text-base lg:text-lg">
              Share your vision for improving our community. Your ideas help shape our future.
            </p>
          </div>

          {/* Form */}
          <form onSubmit={handleSubmit} className="bg-card rounded-lg shadow-elevation-2 p-6 lg:p-8 space-y-6">
            {/* Title Field */}
            <div>
              <Input
                id="title"
                label="Idea Title"
                placeholder="Enter a clear, concise title for your idea"
                value={formData?.title}
                onChange={(e) => handleChange('title', e?.target?.value)}
                onBlur={() => handleBlur('title')}
                error={touched?.title ? errors?.title : ''}
                required
                maxLength={TITLE_MAX_LENGTH}
              />
              <div className="flex justify-end mt-1">
                <span className={`text-xs ${
                  formData?.title?.length > TITLE_MAX_LENGTH * 0.9
                    ? 'text-warning' :'text-muted-foreground'
                }`}>
                  {formData?.title?.length}/{TITLE_MAX_LENGTH}
                </span>
              </div>
            </div>

            {/* Description Field */}
            <div>
              <Textarea
                id="description"
                label="Description"
                description="Provide detailed information about your idea, its benefits, and how it could be implemented."
                placeholder="Describe your idea in detail..."
                value={formData?.description}
                onChange={(e) => handleChange('description', e?.target?.value)}
                onBlur={() => handleBlur('description')}
                error={touched?.description ? errors?.description : ''}
                required
                rows={6}
                maxLength={DESCRIPTION_MAX_LENGTH}
              />
              <div className="flex justify-end mt-1">
                <span className={`text-xs ${
                  formData?.description?.length > DESCRIPTION_MAX_LENGTH * 0.9
                    ? 'text-warning' :'text-muted-foreground'
                }`}>
                  {formData?.description?.length}/{DESCRIPTION_MAX_LENGTH}
                </span>
              </div>
            </div>

            {/* Ward Selection */}
            <div>
              <Select
                id="ward"
                label="Ward"
                description="Select the ward where your idea would be implemented."
                placeholder="Select a ward"
                options={wardOptions}
                value={formData?.ward}
                onChange={(value) => handleChange('ward', value)}
                onOpenChange={(isOpen) => !isOpen && handleBlur('ward')}
                error={touched?.ward ? errors?.ward : ''}
                required
                searchable
              />
            </div>

            {/* Topic Tags */}
            <div>
              <TagSelector
                label="Topic Tags"
                description="Select up to 3 topics that best describe your idea."
                options={topicOptions}
                value={formData?.topics}
                onChange={(value) => handleChange('topics', value)}
                onBlur={() => handleBlur('topics')}
                error={touched?.topics ? errors?.topics : ''}
                required
                maxSelections={3}
                className=""
              />
            </div>

            {/* Privacy Toggle */}
            <div className="pt-4 border-t border-border">
              <Checkbox
                id="isAnonymous"
                label="Post anonymously"
                description="Your name will not be displayed with this idea. Only administrators will have access to your identity."
                checked={formData?.isAnonymous}
                onChange={(e) => handleChange('isAnonymous', e?.target?.checked)}
              />
            </div>

            {/* Action Buttons */}
            <div className="flex flex-col sm:flex-row gap-3 pt-6">
              <Button
                type="submit"
                variant="default"
                size="lg"
                fullWidth
                loading={isSubmitting}
                iconName="Send"
                iconPosition="right"
              >
                {isSubmitting ? 'Submitting...' : 'Submit Idea'}
              </Button>
              <Button
                type="button"
                variant="outline"
                size="lg"
                fullWidth
                onClick={handleCancel}
                disabled={isSubmitting}
              >
                Cancel
              </Button>
            </div>
          </form>

          {/* Help Text */}
          <div className="mt-6 p-4 bg-muted rounded-lg">
            <p className="text-sm text-muted-foreground">
              <strong>Tip:</strong> Great ideas are specific, actionable, and benefit the community. 
              Include details about implementation, costs, and expected outcomes to help others understand your vision.
            </p>
          </div>
        </div>
      </main>
    </div>
  );
};

export default IdeaSubmissionForm;

    # ideas-explorer
        # components

        # FilterPanel.jsx
import React from 'react';
import { Checkbox, CheckboxGroup } from '../../../components/ui/Checkbox';
import Select from '../../../components/ui/Select';
import Button from '../../../components/ui/Button';
import Icon from '../../../components/AppIcon';
import { cn } from '../../../utils/cn';

const FilterPanel = ({
  wards,
  topics,
  selectedWards,
  selectedTopics,
  sortBy,
  onWardChange,
  onTopicChange,
  onSortChange,
  onClearFilters,
  isOpen,
  onClose
}) => {
  const sortOptions = [
    { value: 'votes', label: 'Vote Ranking (Net Votes)' },
    { value: 'upvotes', label: 'Most Upvotes' },
    { value: 'recent', label: 'Most Recent' }
  ];

  const handleWardToggle = (ward) => {
    if (selectedWards?.includes(ward)) {
      onWardChange(selectedWards?.filter(w => w !== ward));
    } else {
      onWardChange([...selectedWards, ward]);
    }
  };

  const handleTopicToggle = (topic) => {
    if (selectedTopics?.includes(topic)) {
      onTopicChange(selectedTopics?.filter(t => t !== topic));
    } else {
      onTopicChange([...selectedTopics, topic]);
    }
  };

  const activeFilterCount = selectedWards?.length + selectedTopics?.length;

  return (
    <>
      {/*Mobile Overlay*/}
      {isOpen && (
        <div
          className="fixed inset-0 bg-black/50 z-dropdown lg:hidden"
          onClick={onClose}
        />
      )}

      {/* Filter Panel */}
      <aside className={cn(
        "fixed lg:sticky top-0 left-0 h-screen lg:h-auto w-80 lg:w-72 bg-card rounded-none lg:rounded-xl border-r lg:border border-border shadow-elevation-3 lg:shadow-elevation-2 p-6 overflow-y-auto z-dropdown lg:z-auto transition-transform lg:transition-none",
        isOpen ? "translate-x-0" : "-translate-x-full lg:translate-x-0"
      )}>
        {/* Mobile Header */}
        <div className="flex items-center justify-between mb-6 lg:hidden">
          <h2 className="font-heading font-semibold text-xl text-foreground">Filters</h2>
          <button
            onClick={onClose}
            className="p-2 hover:bg-muted rounded-lg transition-smooth"
            aria-label="Close filters"
          >
            <Icon name="X" size={20} />
          </button>
        </div>

        {/* Desktop Header */}
        <div className="hidden lg:flex items-center justify-between mb-6">
          <h2 className="font-heading font-semibold text-xl text-foreground">Filters</h2>
          {activeFilterCount > 0 && (
            <span className="px-2 py-1 rounded-full bg-primary/10 text-primary text-xs font-medium">
              {activeFilterCount} active
            </span>
          )}
        </div>

        {/* Sort By */}
        <div className="mb-6">
          <Select
            label="Sort By"
            options={sortOptions}
            value={sortBy}
            onChange={onSortChange}
            className="w-full"
          />
        </div>

        {/* Ward Filter */}
        <div className="mb-6 pb-6 border-b border-border">
          <div className="flex items-center gap-2 mb-4">
            <Icon name="MapPin" size={18} color="var(--color-primary)" />
            <h3 className="font-body font-semibold text-base text-foreground">Ward</h3>
          </div>
          <CheckboxGroup>
            {wards?.map(({ ward, count }) => (
              <Checkbox
                key={ward}
                id={`ward-${ward}`}
                checked={selectedWards?.includes(ward)}
                onChange={() => handleWardToggle(ward)}
                label={
                  <div className="flex items-center justify-between w-full">
                    <span>{ward}</span>
                    <span className="text-xs text-muted-foreground">({count})</span>
                  </div>
                }
              />
            ))}
          </CheckboxGroup>
        </div>

        {/* Topic Filter */}
        <div className="mb-6">
          <div className="flex items-center gap-2 mb-4">
            <Icon name="Tag" size={18} color="var(--color-primary)" />
            <h3 className="font-body font-semibold text-base text-foreground">Topics</h3>
          </div>
          <CheckboxGroup>
            {topics?.map(({ topic, count }) => (
              <Checkbox
                key={topic}
                id={`topic-${topic}`}
                checked={selectedTopics?.includes(topic)}
                onChange={() => handleTopicToggle(topic)}
                label={
                  <div className="flex items-center justify-between w-full">
                    <span>{topic}</span>
                    <span className="text-xs text-muted-foreground">({count})</span>
                  </div>
                }
              />
            ))}
          </CheckboxGroup>
        </div>

        {/* Clear Filters Button */}
        {activeFilterCount > 0 && (
          <Button
            variant="outline"
            fullWidth
            onClick={onClearFilters}
            className="mt-6"
          >
            <Icon name="X" size={16} className="mr-2" />
            Clear All Filters
          </Button>
        )}

        {/* Mobile Apply Button */}
        <Button
          variant="default"
          fullWidth
          onClick={onClose}
          className="mt-4 lg:hidden"
        >
          Apply Filters
        </Button>
      </aside>
    </>
  );
};

export default FilterPanel;

        # IdeaResultCard.jsx
import React from 'react';
import Image from '../../../components/AppImage';
import Icon from '../../../components/AppIcon';

const IdeaResultCard = ({ idea, viewMode, onClick }) => {
  const netVotes = idea?.upvotes - idea?.downvotes;

  if (viewMode === 'list') {
    return (
      <div
        onClick={onClick}
        className="bg-card rounded-lg border border-border shadow-elevation-2 hover:shadow-elevation-3 transition-smooth cursor-pointer overflow-hidden"
      >
        <div className="flex flex-col sm:flex-row">
          {/*Image*/}
          {idea?.image && (
            <div className="w-full sm:w-48 h-40 sm:h-auto flex-shrink-0">
              <Image
                src={idea?.image}
                alt={idea?.imageAlt}
                className="w-full h-full object-cover"
              />
            </div>
          )}

          {/* Content */}
          <div className="flex-1 p-4 sm:p-6">
            <div className="flex items-start justify-between gap-4 mb-3">
              <div className="flex items-center gap-2 flex-wrap">
                <div className="px-2.5 py-1 rounded-full bg-primary/10 border border-primary/20">
                  <span className="text-xs font-medium text-primary">{idea?.ward}</span>
                </div>
                {idea?.topics?.slice(0, 2)?.map((topic, index) => (
                  <span
                    key={index}
                    className="px-2.5 py-1 rounded-full bg-secondary/10 border border-secondary/20 text-xs font-medium text-secondary"
                  >
                    {topic}
                  </span>
                ))}
                {idea?.topics?.length > 2 && (
                  <span className="text-xs text-muted-foreground">+{idea?.topics?.length - 2}</span>
                )}
              </div>
            </div>

            <h3 className="font-heading font-semibold text-lg text-foreground mb-2 line-clamp-1">
              {idea?.title}
            </h3>

            <p className="font-body text-sm text-muted-foreground mb-4 line-clamp-2">
              {idea?.description}
            </p>

            <div className="flex items-center gap-4">
              <div className="flex items-center gap-1.5">
                <Icon name="ThumbsUp" size={16} color="var(--color-success)" />
                <span className="text-sm font-medium text-foreground">{idea?.upvotes}</span>
              </div>
              <div className="flex items-center gap-1.5">
                <Icon name="ThumbsDown" size={16} color="var(--color-muted-foreground)" />
                <span className="text-sm font-medium text-foreground">{idea?.downvotes}</span>
              </div>
              <div className="ml-auto flex items-center gap-1.5 px-3 py-1 rounded-full bg-muted">
                <Icon name="TrendingUp" size={14} color="var(--color-primary)" />
                <span className="text-sm font-medium text-foreground">{netVotes > 0 ? '+' : ''}{netVotes}</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }

  // Grid view
  return (
    <div
      onClick={onClick}
      className="bg-card rounded-xl shadow-elevation-3 hover:shadow-elevation-4 border border-border transition-smooth cursor-pointer overflow-hidden hover:lift-hover"
    >
      {/*Image*/}
      {idea?.image && (
        <div className="w-full h-48 overflow-hidden">
          <Image
            src={idea?.image}
            alt={idea?.imageAlt}
            className="w-full h-full object-cover"
          />
        </div>
      )}

      {/* Content */}
      <div className="p-6">
        <div className="flex items-center gap-2 mb-3">
          <div className="w-10 h-10 rounded-full bg-primary/10 flex items-center justify-center">
            <Icon name="Lightbulb" size={18} color="var(--color-primary)" />
          </div>
          <div className="px-3 py-1 rounded-full bg-primary/10 border border-primary/20">
            <span className="text-xs font-medium text-primary">{idea?.ward}</span>
          </div>
        </div>

        <h3 className="font-heading font-semibold text-xl text-foreground mb-2 line-clamp-2">
          {idea?.title}
        </h3>

        <p className="font-body text-sm text-muted-foreground mb-4 line-clamp-3">
          {idea?.description}
        </p>

        <div className="flex flex-wrap gap-2 mb-4">
          {idea?.topics?.map((topic, index) => (
            <span
              key={index}
              className="px-2.5 py-1 rounded-lg bg-secondary/10 border border-secondary/20 text-xs font-medium text-secondary"
            >
              {topic}
            </span>
          ))}
        </div>

        <div className="flex items-center justify-between pt-4 border-t border-border">
          <div className="flex items-center gap-4">
            <div className="flex items-center gap-1.5">
              <Icon name="ThumbsUp" size={18} color="var(--color-success)" />
              <span className="text-base font-medium text-foreground">{idea?.upvotes}</span>
            </div>
            <div className="flex items-center gap-1.5">
              <Icon name="ThumbsDown" size={18} color="var(--color-muted-foreground)" />
              <span className="text-base font-medium text-foreground">{idea?.downvotes}</span>
            </div>
          </div>

          <div className="flex items-center gap-1.5 px-3 py-1.5 rounded-full bg-primary/10">
            <Icon name="TrendingUp" size={16} color="var(--color-primary)" />
            <span className="text-sm font-medium text-primary">{netVotes > 0 ? '+' : ''}{netVotes}</span>
          </div>
        </div>
      </div>
    </div>
  );
};

export default IdeaResultCard;

        # ResultsGrid.jsx
import React from 'react';
import IdeaResultCard from './IdeaResultCard';
import Icon from '../../../components/AppIcon';

const ResultsGrid = ({ ideas, viewMode, onIdeaClick }) => {
  if (ideas?.length === 0) {
    return (
      <div className="flex flex-col items-center justify-center py-16 px-6 bg-card rounded-xl border border-border">
        <div className="w-16 h-16 rounded-full bg-muted flex items-center justify-center mb-4">
          <Icon name="Search" size={32} color="var(--color-muted-foreground)" />
        </div>
        <h3 className="font-heading font-semibold text-xl text-foreground mb-2">
          No ideas found
        </h3>
        <p className="font-body text-base text-muted-foreground text-center max-w-md">
          Try adjusting your filters or search query to discover more community ideas.
        </p>
      </div>
    );
  }

  if (viewMode === 'list') {
    return (
      <div className="space-y-4">
        {ideas?.map(idea => (
          <IdeaResultCard
            key={idea?.id}
            idea={idea}
            viewMode="list"
            onClick={() => onIdeaClick(idea)}
          />
        ))}
      </div>
    );
  }

  return (
    <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
      {ideas?.map(idea => (
        <IdeaResultCard
          key={idea?.id}
          idea={idea}
          viewMode="grid"
          onClick={() => onIdeaClick(idea)}
        />
      ))}
    </div>
  );
};

export default ResultsGrid;

        # SearchBar.jsx
import React from 'react';

import Icon from '../../../components/AppIcon';

const SearchBar = ({ searchQuery, onSearchChange, resultCount }) => {
  return (
    <div className="mb-6">
      <div className="relative">
        <div className="absolute left-4 top-1/2 -translate-y-1/2 pointer-events-none">
          <Icon name="Search" size={20} color="var(--color-muted-foreground)" />
        </div>
        <input
          type="text"
          value={searchQuery}
          onChange={(e) => onSearchChange(e?.target?.value)}
          placeholder="Search ideas by title or description..."
          className="w-full h-12 pl-12 pr-4 rounded-lg border border-border bg-card text-foreground placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:border-transparent transition-smooth shadow-elevation-1 hover:shadow-elevation-2"
        />
      </div>
    </div>
  );
};

export default SearchBar;

    # index.jsx
import React, { useState, useMemo } from 'react';
import { useNavigate } from 'react-router-dom';
import Header from '../../components/ui/Header';
import FilterPanel from './components/FilterPanel';
import ResultsGrid from './components/ResultsGrid';
import SearchBar from './components/SearchBar';
import Icon from '../../components/AppIcon';

const IdeasExplorer = () => {
  const navigate = useNavigate();
  
  // Mock data - same structure as home-swipe-deck
  const communityIdeas = [
    {
      id: 1,
      title: "Community Garden Initiative",
      description: "Transform the vacant lot on Maple Street into a thriving community garden where residents can grow fresh vegetables, herbs, and flowers. This space will promote sustainable living, provide educational opportunities for children, and create a gathering place for neighbors to connect and share gardening knowledge.",
      ward: "Ward 3",
      topics: ["Environment", "Community"],
      upvotes: 142,
      downvotes: 23,
      image: "https://img.rocket.new/generatedImages/rocket_gen_img_15f18d045-1764666615393.png",
      imageAlt: "Vibrant community garden with raised wooden beds filled with green vegetables and colorful flowers, people working together in sunny outdoor setting"
    },
    {
      id: 2,
      title: "Free Public WiFi Zones",
      description: "Install high-speed public WiFi access points in all major parks, libraries, and community centers throughout the city. This initiative will bridge the digital divide, support remote workers and students, and ensure all residents have equal access to online resources and opportunities regardless of their economic status.",
      ward: "Ward 1",
      topics: ["Technology", "Education"],
      upvotes: 287,
      downvotes: 45,
      image: "https://img.rocket.new/generatedImages/rocket_gen_img_190e975d8-1764821908241.png",
      imageAlt: "Modern public park with people using laptops and smartphones under trees, WiFi symbol overlay showing connectivity, bright daylight with urban skyline background"
    },
    {
      id: 3,
      title: "Bike Lane Expansion Project",
      description: "Create a comprehensive network of protected bike lanes connecting residential neighborhoods to downtown, schools, and shopping districts. This infrastructure improvement will reduce traffic congestion, lower carbon emissions, improve air quality, and provide safe transportation options for cyclists of all ages and skill levels.",
      ward: "Ward 5",
      topics: ["Transportation", "Environment"],
      upvotes: 198,
      downvotes: 67,
      image: "https://images.unsplash.com/photo-1728260390952-527e04661ce3",
      imageAlt: "Wide protected bike lane with green painted surface and white bicycle symbols, cyclists riding safely separated from car traffic by concrete barriers, tree-lined urban street"
    },
    {
      id: 4,
      title: "Monthly Farmers Market",
      description: "Establish a weekly farmers market in the downtown plaza featuring local farmers, artisans, and food vendors. This market will support local agriculture, provide access to fresh organic produce, create economic opportunities for small businesses, and foster community connections through shared cultural experiences and live entertainment.",
      ward: "Ward 2",
      topics: ["Economy", "Community", "Health"],
      upvotes: 321,
      downvotes: 34,
      image: "https://img.rocket.new/generatedImages/rocket_gen_img_1227712f7-1764915815373.png",
      imageAlt: "Bustling outdoor farmers market with colorful produce stands displaying fresh fruits and vegetables, vendors and customers interacting, white tents and morning sunlight"
    },
    {
      id: 5,
      title: "Youth Sports Complex",
      description: "Build a modern multi-sport facility with soccer fields, basketball courts, baseball diamonds, and a running track. This complex will provide safe recreational spaces for youth programs, reduce juvenile delinquency, promote physical fitness and healthy lifestyles, and host community sporting events that bring families together.",
      ward: "Ward 4",
      topics: ["Recreation", "Youth", "Health"],
      upvotes: 256,
      downvotes: 89,
      image: "https://img.rocket.new/generatedImages/rocket_gen_img_103b27222-1765060794116.png",
      imageAlt: "Modern outdoor sports complex with artificial turf soccer field, running track, basketball courts, and playground equipment, children playing sports with parents watching from bleachers"
    },
    {
      id: 6,
      title: "Senior Citizen Activity Center",
      description: "Renovate the old community center into a dedicated space for senior citizens featuring exercise classes, art workshops, computer training, social events, and health screenings. This center will combat social isolation among elderly residents, provide lifelong learning opportunities, and create an inclusive environment where seniors can maintain active and engaged lifestyles.",
      ward: "Ward 3",
      topics: ["Health", "Community", "Education"],
      upvotes: 189,
      downvotes: 28,
      image: "https://img.rocket.new/generatedImages/rocket_gen_img_15f39f3cc-1764654349660.png",
      imageAlt: "Bright community center interior with senior citizens participating in group exercise class, instructor leading stretching activities, large windows with natural light and colorful exercise mats"
    },
    {
      id: 7,
      title: "Public Art Installation Program",
      description: "Commission local artists to create murals, sculptures, and interactive art installations throughout the city to beautify public spaces and celebrate our diverse cultural heritage. This program will transform underutilized areas into vibrant destinations, support the local arts community, attract tourism, and give residents pride in their neighborhoods.",
      ward: "Ward 1",
      topics: ["Arts", "Community", "Tourism"],
      upvotes: 167,
      downvotes: 52,
      image: "https://images.unsplash.com/photo-1726501604970-654825da7e1f",
      imageAlt: "Large colorful street mural on brick building wall depicting community diversity and cultural symbols, artist on ladder painting details, people stopping to admire artwork"
    },
    {
      id: 8,
      title: "Zero Waste Initiative",
      description: "Implement a comprehensive recycling and composting program with educational campaigns, convenient drop-off locations, and incentives for waste reduction. This initiative will divert 75% of waste from landfills, reduce greenhouse gas emissions, create green jobs in waste management, and position our city as an environmental leader.",
      ward: "Ward 5",
      topics: ["Environment", "Education", "Economy"],
      upvotes: 234,
      downvotes: 71,
      image: "https://img.rocket.new/generatedImages/rocket_gen_img_184b5085b-1765154327034.png",
      imageAlt: "Modern recycling center with color-coded bins for different materials, residents sorting waste into blue green and brown containers, educational posters on walls showing recycling process"
    }
  ];

  // Filter states
  const [selectedWards, setSelectedWards] = useState([]);
  const [selectedTopics, setSelectedTopics] = useState([]);
  const [sortBy, setSortBy] = useState('votes');
  const [searchQuery, setSearchQuery] = useState('');
  const [viewMode, setViewMode] = useState('grid'); // 'grid' or 'list'
  const [filterPanelOpen, setFilterPanelOpen] = useState(false);

  // Extract unique wards and topics with counts
  const wards = useMemo(() => {
    const wardCounts = {};
    communityIdeas?.forEach(idea => {
      wardCounts[idea?.ward] = (wardCounts?.[idea?.ward] || 0) + 1;
    });
    return Object.entries(wardCounts)?.map(([ward, count]) => ({ ward, count }));
  }, []);

  const topics = useMemo(() => {
    const topicCounts = {};
    communityIdeas?.forEach(idea => {
      idea?.topics?.forEach(topic => {
        topicCounts[topic] = (topicCounts?.[topic] || 0) + 1;
      });
    });
    return Object.entries(topicCounts)?.map(([topic, count]) => ({ topic, count }));
  }, []);

  // Filter and sort ideas
  const filteredIdeas = useMemo(() => {
    let filtered = communityIdeas;

    // Filter by wards
    if (selectedWards?.length > 0) {
      filtered = filtered?.filter(idea => selectedWards?.includes(idea?.ward));
    }

    // Filter by topics
    if (selectedTopics?.length > 0) {
      filtered = filtered?.filter(idea => 
        idea?.topics?.some(topic => selectedTopics?.includes(topic))
      );
    }

    // Filter by search query
    if (searchQuery) {
      const query = searchQuery?.toLowerCase();
      filtered = filtered?.filter(idea => 
        idea?.title?.toLowerCase()?.includes(query) ||
        idea?.description?.toLowerCase()?.includes(query)
      );
    }

    // Sort ideas
    const sorted = [...filtered];
    if (sortBy === 'votes') {
      sorted?.sort((a, b) => (b?.upvotes - b?.downvotes) - (a?.upvotes - a?.downvotes));
    } else if (sortBy === 'upvotes') {
      sorted?.sort((a, b) => b?.upvotes - a?.upvotes);
    } else if (sortBy === 'recent') {
      sorted?.sort((a, b) => b?.id - a?.id);
    }

    return sorted;
  }, [communityIdeas, selectedWards, selectedTopics, searchQuery, sortBy]);

  const handleClearFilters = () => {
    setSelectedWards([]);
    setSelectedTopics([]);
    setSearchQuery('');
    setSortBy('votes');
  };

  const handleIdeaClick = (idea) => {
    navigate('/idea-detail-view', { state: { idea } });
  };

  const activeFilterCount = selectedWards?.length + selectedTopics?.length + (searchQuery ? 1 : 0);

  return (
    <div className="min-h-screen bg-background">
      <Header />

      <div className="pt-16 lg:pt-20">
        <div className="max-w-7xl mx-auto px-6 lg:px-12 py-8 lg:py-12">
          {/* Page Header */}
          <div className="mb-8">
            <h1 className="font-heading font-bold text-3xl lg:text-4xl text-foreground mb-2">
              Explore Ideas
            </h1>
            <p className="font-body text-base lg:text-lg text-muted-foreground">
              Discover and filter community ideas by ward, topic, or vote ranking
            </p>
          </div>

          {/* Search Bar */}
          <SearchBar 
            searchQuery={searchQuery}
            onSearchChange={setSearchQuery}
            resultCount={filteredIdeas?.length}
          />

          {/* Mobile Filter Toggle */}
          <div className="lg:hidden mb-6">
            <button
              onClick={() => setFilterPanelOpen(!filterPanelOpen)}
              className="flex items-center justify-between w-full px-4 py-3 bg-card rounded-lg border border-border shadow-elevation-1 hover:shadow-elevation-2 transition-smooth"
            >
              <div className="flex items-center gap-2">
                <Icon name="SlidersHorizontal" size={20} color="var(--color-primary)" />
                <span className="font-body font-medium text-foreground">Filters</span>
                {activeFilterCount > 0 && (
                  <span className="px-2 py-0.5 rounded-full bg-primary text-primary-foreground text-xs font-medium">
                    {activeFilterCount}
                  </span>
                )}
              </div>
              <Icon 
                name="ChevronDown" 
                size={20} 
                className={`transition-transform ${filterPanelOpen ? 'rotate-180' : ''}`}
              />
            </button>
          </div>

          {/* Main Content Area */}
          <div className="flex flex-col lg:flex-row gap-6 lg:gap-8">
            {/* Filter Panel */}
            <FilterPanel
              wards={wards}
              topics={topics}
              selectedWards={selectedWards}
              selectedTopics={selectedTopics}
              sortBy={sortBy}
              onWardChange={setSelectedWards}
              onTopicChange={setSelectedTopics}
              onSortChange={setSortBy}
              onClearFilters={handleClearFilters}
              isOpen={filterPanelOpen}
              onClose={() => setFilterPanelOpen(false)}
            />

            {/* Results Area */}
            <div className="flex-1">
              {/* View Controls */}
              <div className="flex items-center justify-between mb-6">
                <div className="flex items-center gap-2">
                  <span className="font-body text-sm text-muted-foreground">
                    {filteredIdeas?.length} {filteredIdeas?.length === 1 ? 'idea' : 'ideas'} found
                  </span>
                  {activeFilterCount > 0 && (
                    <button
                      onClick={handleClearFilters}
                      className="text-sm text-primary hover:underline font-medium"
                    >
                      Clear all
                    </button>
                  )}
                </div>

                {/* View Mode Toggle */}
                <div className="flex items-center gap-1 bg-muted rounded-lg p-1">
                  <button
                    onClick={() => setViewMode('grid')}
                    className={`p-2 rounded transition-smooth ${
                      viewMode === 'grid' ?'bg-card shadow-elevation-1' :'hover:bg-card/50'
                    }`}
                    aria-label="Grid view"
                  >
                    <Icon name="LayoutGrid" size={18} color={viewMode === 'grid' ? 'var(--color-primary)' : 'var(--color-muted-foreground)'} />
                  </button>
                  <button
                    onClick={() => setViewMode('list')}
                    className={`p-2 rounded transition-smooth ${
                      viewMode === 'list' ?'bg-card shadow-elevation-1' :'hover:bg-card/50'
                    }`}
                    aria-label="List view"
                  >
                    <Icon name="List" size={18} color={viewMode === 'list' ? 'var(--color-primary)' : 'var(--color-muted-foreground)'} />
                  </button>
                </div>
              </div>

              {/* Results Grid/List */}
              <ResultsGrid 
                ideas={filteredIdeas}
                viewMode={viewMode}
                onIdeaClick={handleIdeaClick}
              />
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default IdeasExplorer;

    # landing-page
        # index 
import React from 'react';
import { Link } from 'react-router-dom';
import Icon from '../../components/AppIcon';
import Button from '../../components/ui/Button';
import HeroSection from './components/HeroSection';
import HowItWorksSection from './components/HowItWorksSection';
import PrivacySection from './components/PrivacySection';
import FinalCTASection from './components/FinalCTASection';
import Footer from './components/Footer';

const LandingPage = () => {
  return (
    <div className="min-h-screen bg-background">
      {/*Simple Navigation Header*/}
      <header className="fixed top-0 left-0 right-0 z-navigation bg-card/80 backdrop-blur-sm shadow-elevation-1">
        <div className="max-w-7xl mx-auto px-6 lg:px-12">
          <div className="flex items-center justify-between h-16 lg:h-20">
            <div className="flex items-center gap-3">
              <div className="w-10 h-10 lg:w-12 lg:h-12 bg-primary rounded-lg flex items-center justify-center">
                <Icon name="Vote" size={24} color="#ffffff" />
              </div>
              <span className="font-heading font-bold text-xl lg:text-2xl text-primary">
                Nairobi Talks
              </span>
            </div>
            <Link to="/home-swipe-deck">
              <Button variant="default" size="lg" className="font-semibold">
                Get Started
              </Button>
            </Link>
          </div>
        </div>
      </header>

      {/* Main Content */}
      <main className="pt-16 lg:pt-20">
        <HeroSection />
        <HowItWorksSection />
        <PrivacySection />
        <FinalCTASection />
        <Footer />
      </main>
    </div>
  );
};

export default LandingPage;

# components

    # FinalCTASection.jsx
import React from 'react';
import { Link } from 'react-router-dom';
import Button from '../../../components/ui/Button';
import Icon from '../../../components/AppIcon';

const FinalCTASection = () => {
  return (
    <section className="relative py-20 lg:py-32 bg-background overflow-hidden">
      {/*Background Decoration*/}
      <div className="absolute inset-0 overflow-hidden opacity-30">
        <div className="absolute top-0 left-1/4 w-96 h-96 bg-secondary/20 rounded-full blur-3xl" />
        <div className="absolute bottom-0 right-1/4 w-96 h-96 bg-primary/20 rounded-full blur-3xl" />
      </div>

      <div className="relative z-10 max-w-4xl mx-auto px-6 lg:px-12 text-center">
        {/* Icon Group */}
        <div className="flex justify-center gap-4 mb-8">
          <div className="w-12 h-12 bg-card rounded-full flex items-center justify-center shadow-elevation-2">
            <Icon name="Lightbulb" size={24} color="#3aa966" />
          </div>
          <div className="w-12 h-12 bg-card rounded-full flex items-center justify-center shadow-elevation-2">
            <Icon name="Hand" size={24} color="#009339" />
          </div>
          <div className="w-12 h-12 bg-card rounded-full flex items-center justify-center shadow-elevation-2">
            <Icon name="ThumbsUp" size={24} color="#3aa966" />
          </div>
          <div className="w-12 h-12 bg-card rounded-full flex items-center justify-center shadow-elevation-2">
            <Icon name="MapPin" size={24} color="#009339" />
          </div>
        </div>

        {/* Heading */}
        <h2 className="font-heading font-bold text-3xl md:text-4xl lg:text-5xl text-primary mb-6">
          Join Your Neighbors – Start Now
        </h2>
        <p className="text-lg md:text-xl text-foreground/80 mb-10 max-w-2xl mx-auto">
          Be part of the movement shaping Nairobi's future. Your voice matters, and together we can create lasting change.
        </p>

        {/* CTA Buttons */}
        <div className="flex flex-col sm:flex-row gap-4 justify-center mb-12">
          <Link to="/home-swipe-deck">
            <Button
              size="xl"
              className="w-full sm:w-auto bg-primary hover:bg-primary/90 text-white font-bold px-10 py-6 text-lg rounded-xl shadow-elevation-3 hover:shadow-elevation-4 transition-smooth"
            >
              Start Exploring Ideas
            </Button>
          </Link>
          <Link to="/idea-submission-form">
            <Button
              variant="outline"
              size="xl"
              className="w-full sm:w-auto border-2 border-primary text-primary hover:bg-primary/5 font-bold px-10 py-6 text-lg rounded-xl transition-smooth"
            >
              Submit Your Idea
            </Button>
          </Link>
        </div>

        {/* Social Proof */}
        <div className="flex flex-wrap items-center justify-center gap-8 text-sm text-foreground/60">
          <div className="flex items-center gap-2">
            <Icon name="Users" size={18} color="#3aa966" />
            <span>10,000+ Active Users</span>
          </div>
          <div className="flex items-center gap-2">
            <Icon name="Star" size={18} color="#3aa966" />
            <span>4.8/5 Rating</span>
          </div>
          <div className="flex items-center gap-2">
            <Icon name="Award" size={18} color="#3aa966" />
            <span>Award-Winning Platform</span>
          </div>
        </div>
      </div>
    </section>
  );
};

export default FinalCTASection;
    # Footer.jsx
import React from 'react';
import { Link } from 'react-router-dom';
import Icon from '../../../components/AppIcon';

const Footer = () => {
  return (
    <footer className="bg-card border-t border-border py-12">
      <div className="max-w-7xl mx-auto px-6 lg:px-12">
        <div className="grid md:grid-cols-3 gap-8 mb-8">
          {/*Brand*/}
          <div>
            <div className="flex items-center gap-3 mb-4">
              <div className="w-10 h-10 bg-primary rounded-lg flex items-center justify-center">
                <Icon name="Vote" size={20} color="#ffffff" />
              </div>
              <span className="font-heading font-bold text-xl text-primary">
                Nairobi Talks
              </span>
            </div>
            <p className="text-sm text-foreground/70 leading-relaxed">
              Empowering citizens to shape their community through anonymous idea submission and democratic voting.
            </p>
          </div>

          {/* Quick Links */}
          <div>
            <h3 className="font-heading font-semibold text-foreground mb-4">Quick Links</h3>
            <ul className="space-y-2">
              <li>
                <Link to="/home-swipe-deck" className="text-sm text-foreground/70 hover:text-primary transition-smooth">
                  Discover Ideas
                </Link>
              </li>
              <li>
                <Link to="/ideas-explorer" className="text-sm text-foreground/70 hover:text-primary transition-smooth">
                  Explore All
                </Link>
              </li>
              <li>
                <Link to="/idea-submission-form" className="text-sm text-foreground/70 hover:text-primary transition-smooth">
                  Submit Idea
                </Link>
              </li>
              <li>
                <Link to="/user-profile-dashboard" className="text-sm text-foreground/70 hover:text-primary transition-smooth">
                  Your Profile
                </Link>
              </li>
            </ul>
          </div>

          {/* Community */}
          <div>
            <h3 className="font-heading font-semibold text-foreground mb-4">Community</h3>
            <div className="flex gap-3">
              <button className="w-10 h-10 bg-muted rounded-lg flex items-center justify-center hover:bg-primary hover:text-white transition-smooth">
                <Icon name="Twitter" size={18} />
              </button>
              <button className="w-10 h-10 bg-muted rounded-lg flex items-center justify-center hover:bg-primary hover:text-white transition-smooth">
                <Icon name="Facebook" size={18} />
              </button>
              <button className="w-10 h-10 bg-muted rounded-lg flex items-center justify-center hover:bg-primary hover:text-white transition-smooth">
                <Icon name="Instagram" size={18} />
              </button>
            </div>
          </div>
        </div>

        {/* Bottom Bar */}
        <div className="pt-8 border-t border-border flex flex-col md:flex-row justify-between items-center gap-4">
          <p className="text-sm text-foreground/60">
            © 2024 Nairobi Talks. Powered by citizens like you.
          </p>
          <div className="flex items-center gap-2 text-sm text-foreground/60">
            <Icon name="Heart" size={16} color="#3aa966" />
            <span>Made with love for Nairobi</span>
          </div>
        </div>
      </div>
    </footer>
  );
};

export default Footer;

    # HeroSection.jsx
import React from 'react';
import { Link } from 'react-router-dom';
import Button from '../../../components/ui/Button';
import Icon from '../../../components/AppIcon';

const HeroSection = () => {
  return (
    <section className="relative min-h-screen flex items-center overflow-hidden bg-background">
      {/*Abstract Green Wave Background */}
      <div className="absolute inset-0 overflow-hidden">
        <svg
          className="absolute w-full h-full"
          viewBox="0 0 1440 800"
          preserveAspectRatio="xMidYMid slice"
          xmlns="http://www.w3.org/2000/svg"
        >
          {/* Wave 1 - Deep Green */}
          <path
            d="M0,400 C320,300 420,500 720,400 C1020,300 1120,500 1440,400 L1440,800 L0,800 Z"
            fill="#009339"
            opacity="0.05"
          />
          {/* Wave 2 - Medium Green */}
          <path
            d="M0,500 C360,400 480,600 840,500 C1200,400 1320,600 1440,500 L1440,800 L0,800 Z"
            fill="#3aa966"
            opacity="0.08"
          />
          {/* Wave 3 - Light accent*/}
          <path
            d="M0,600 C400,520 520,680 960,600 C1280,520 1360,680 1440,600 L1440,800 L0,800 Z"
            fill="#3aa966"
            opacity="0.05"
          />
        </svg>
      </div>

      <div className="relative z-10 max-w-7xl mx-auto px-6 lg:px-12 py-20 lg:py-32">
        <div className="grid lg:grid-cols-2 gap-12 lg:gap-16 items-center">
          {/* Left Content */}
          <div className="text-center lg:text-left space-y-8">
            <div className="space-y-4">
              <h1 className="font-heading font-bold text-4xl md:text-5xl lg:text-6xl text-primary leading-tight">
                Shape Your Community
              </h1>
              <p className="text-lg md:text-xl text-foreground/80 max-w-2xl mx-auto lg:mx-0">
                Submit ideas anonymously. Swipe to vote on what matters. Help turn great ideas into action.
              </p>
            </div>

            <div className="flex flex-col sm:flex-row gap-4 justify-center lg:justify-start">
              <Link to="/home-swipe-deck">
                <Button
                  size="xl"
                  className="w-full sm:w-auto bg-primary hover:bg-primary/90 text-white font-semibold px-8 py-6 text-lg rounded-xl shadow-elevation-3 hover:shadow-elevation-4 transition-smooth"
                >
                  Start Exploring Ideas
                </Button>
              </Link>
              <Link to="/ideas-explorer">
                <Button
                  variant="outline"
                  size="xl"
                  className="w-full sm:w-auto border-2 border-primary text-primary hover:bg-primary/5 font-semibold px-8 py-6 text-lg rounded-xl transition-smooth"
                >
                  Browse All Ideas
                </Button>
              </Link>
            </div>

            {/* Quick Stats */}
            <div className="flex flex-wrap gap-8 justify-center lg:justify-start pt-8">
              <div className="text-center lg:text-left">
                <div className="font-heading font-bold text-3xl text-primary">1,200+</div>
                <div className="text-sm text-foreground/60">Ideas Submitted</div>
              </div>
              <div className="text-center lg:text-left">
                <div className="font-heading font-bold text-3xl text-primary">8,500+</div>
                <div className="text-sm text-foreground/60">Votes Cast</div>
              </div>
              <div className="text-center lg:text-left">
                <div className="font-heading font-bold text-3xl text-primary">45+</div>
                <div className="text-sm text-foreground/60">Ideas Implemented</div>
              </div>
            </div>
          </div>

          {/* Right Content - Phone Mockup */}
          <div className="relative flex justify-center lg:justify-end">
            <div className="relative w-full max-w-sm lg:max-w-md">
              {/* Phone Frame */}
              <div className="relative bg-gray-900 rounded-[3rem] p-3 shadow-elevation-5">
                <div className="bg-background rounded-[2.5rem] overflow-hidden">
                  {/* Phone Screen Content */}
                  <div className="relative aspect-[9/19.5]">
                    {/* Mock Swipe Card */}
                    <div className="absolute inset-4 bg-white rounded-2xl shadow-elevation-3 p-6 flex flex-col">
                      <div className="flex items-start justify-between mb-4">
                        <span className="px-3 py-1 bg-secondary/10 text-secondary text-xs font-medium rounded-full">
                          Transportation
                        </span>
                        <Icon name="MapPin" size={20} color="#6b7280" />
                      </div>
                      <h3 className="font-heading font-semibold text-lg text-foreground mb-3">
                        Protected Bike Lanes on Ngong Road
                      </h3>
                      <p className="text-sm text-foreground/70 flex-1">
                        Add dedicated cycling infrastructure to improve safety and reduce traffic congestion...
                      </p>
                      <div className="flex items-center justify-between mt-4 pt-4 border-t border-border">
                        <div className="flex items-center gap-2">
                          <Icon name="ThumbsUp" size={16} color="#3aa966" />
                          <span className="text-sm font-medium text-foreground">234 votes</span>
                        </div>
                        <span className="text-xs text-foreground/50">Westlands Ward</span>
                      </div>
                    </div>

                    {/* Green LIKE Overlay */}
                    <div className="absolute inset-4 bg-secondary/20 rounded-2xl border-4 border-secondary flex items-center justify-center">
                      <div className="bg-secondary text-white font-heading font-bold text-4xl px-8 py-4 rounded-xl transform rotate-12 shadow-elevation-4">
                        LIKE
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              {/* Floating Icons */}
              <div className="absolute -left-4 top-1/4 bg-white rounded-full p-3 shadow-elevation-3 animate-bounce">
                <Icon name="Lightbulb" size={24} color="#3aa966" />
              </div>
              <div className="absolute -right-4 top-1/3 bg-white rounded-full p-3 shadow-elevation-3 animate-bounce" style={{ animationDelay: '0.5s' }}>
                <Icon name="Heart" size={24} color="#009339" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

export default HeroSection;

    # HowItWorksSection.jsx
import React from 'react';
import Icon from '../../../components/AppIcon';

const steps = [
  {
    icon: 'Lightbulb',
    title: 'Submit an Idea',
    description: 'Share your idea anonymously in under 2 minutes',
    color: '#3aa966'
  },
  {
    icon: 'Hand',
    title: 'Swipe to Vote',
    description: 'Swipe right to support ideas you love',
    color: '#009339'
  },
  {
    icon: 'TrendingUp',
    title: 'Make an Impact',
    description: 'Top-voted ideas are reviewed by county officials',
    color: '#3aa966'
  }
];

const HowItWorksSection = () => {
  return (
    <section className="relative py-20 lg:py-32 bg-background">
      <div className="max-w-7xl mx-auto px-6 lg:px-12">
        {/*Section Header*/}
        <div className="text-center mb-16">
          <h2 className="font-heading font-bold text-3xl md:text-4xl lg:text-5xl text-primary mb-4">
            How It Works
          </h2>
          <p className="text-lg text-foreground/70 max-w-2xl mx-auto">
            Three simple steps to make your voice heard and create real change in your community
          </p>
        </div>

        {/* Steps Grid */}
        <div className="grid md:grid-cols-3 gap-8 lg:gap-12">
          {steps?.map((step, index) => (
            <div
              key={index}
              className="relative bg-card rounded-2xl p-8 shadow-elevation-2 hover:shadow-elevation-3 transition-smooth border-2 border-secondary/20 hover:border-secondary/40 group"
            >
              {/* Step Number */}
              <div className="absolute -top-4 -left-4 w-12 h-12 bg-primary text-white rounded-full flex items-center justify-center font-heading font-bold text-xl shadow-elevation-3">
                {index + 1}
              </div>

              {/* Icon */}
              <div className="mb-6 flex justify-center">
                <div className="w-20 h-20 bg-secondary/10 rounded-2xl flex items-center justify-center group-hover:scale-110 transition-smooth">
                  <Icon name={step?.icon} size={40} color={step?.color} />
                </div>
              </div>

              {/* Content */}
              <div className="text-center space-y-3">
                <h3 className="font-heading font-semibold text-xl text-primary">
                  {step?.title}
                </h3>
                <p className="text-foreground/70 leading-relaxed">
                  {step?.description}
                </p>
              </div>

              {/* Decorative Border Accent */}
              <div className="absolute bottom-0 left-0 right-0 h-1 bg-gradient-to-r from-secondary to-primary rounded-b-2xl opacity-0 group-hover:opacity-100 transition-smooth" />
            </div>
          ))}
        </div>

        {/* Connection Lines (Desktop Only) */}
        <div className="hidden md:block absolute top-1/2 left-0 right-0 -translate-y-1/2 pointer-events-none">
          <div className="max-w-7xl mx-auto px-6 lg:px-12">
            <div className="grid md:grid-cols-3 gap-8 lg:gap-12">
              <div className="relative">
                <div className="absolute top-1/2 -right-4 w-8 h-0.5 bg-secondary/30" />
              </div>
              <div className="relative">
                <div className="absolute top-1/2 -right-4 w-8 h-0.5 bg-secondary/30" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
};

export default HowItWorksSection;

    # PrivacySection.j
import React from 'react';
import Icon from '../../../components/AppIcon';

const privacyFeatures = [
  {
    icon: 'Shield',
    title: 'Anonymous Submissions',
    description: 'Share your ideas without revealing your identity'
  },
  {
    icon: 'Lock',
    title: 'No Account Required',
    description: 'Vote and participate without signing up'
  },
  {
    icon: 'Eye',
    title: 'Privacy Protected',
    description: 'Your data is never sold or shared with third parties'
  },
  {
    icon: 'Users',
    title: 'Community Driven',
    description: 'Built by citizens, for citizens'
  }
];

const PrivacySection = () => {
  return (
    <section className="relative py-20 lg:py-32 bg-[#e5f3ed]">
      <div className="max-w-7xl mx-auto px-6 lg:px-12">
        {/*Section Header*/}
        <div className="text-center mb-16">
          <div className="inline-flex items-center justify-center w-16 h-16 bg-primary/10 rounded-2xl mb-6">
            <Icon name="Shield" size={32} color="#009339" />
          </div>
          <h2 className="font-heading font-bold text-3xl md:text-4xl lg:text-5xl text-primary mb-4">
            Privacy & Trust
          </h2>
          <p className="text-lg text-foreground/80 max-w-3xl mx-auto leading-relaxed">
            Your privacy is protected. No account needed to vote. Anonymous submissions always available.
            We believe in transparent, secure civic engagement.
          </p>
        </div>

        {/* Features Grid */}
        <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-6 lg:gap-8">
          {privacyFeatures?.map((feature, index) => (
            <div
              key={index}
              className="bg-card rounded-xl p-6 shadow-elevation-1 hover:shadow-elevation-3 transition-smooth text-center group"
            >
              <div className="inline-flex items-center justify-center w-14 h-14 bg-secondary/10 rounded-xl mb-4 group-hover:scale-110 transition-smooth">
                <Icon name={feature?.icon} size={28} color="#3aa966" />
              </div>
              <h3 className="font-heading font-semibold text-lg text-primary mb-2">
                {feature?.title}
              </h3>
              <p className="text-sm text-foreground/70 leading-relaxed">
                {feature?.description}
              </p>
            </div>
          ))}
        </div>

        {/* Trust Badge */}
        <div className="mt-16 text-center">
          <div className="inline-flex items-center gap-3 bg-card px-6 py-4 rounded-full shadow-elevation-2">
            <Icon name="CheckCircle" size={24} color="#3aa966" />
            <span className="font-medium text-foreground">
              Trusted by <span className="font-bold text-primary">10,000+</span> Nairobi residents
            </span>
          </div>
        </div>
      </div>
    </section>
  );
};

export default PrivacySection;

# user-profile-dashboard

## index

import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import Header from '../../components/ui/Header';
import Icon from '../../components/AppIcon';
import UserStatsHeader from './components/UserStatsHeader';
import MyIdeasSection from './components/MyIdeasSection';
import VotingHistorySection from './components/VotingHistorySection';
import CommunityStatsSection from './components/CommunityStatsSection';

const UserProfileDashboard = () => {
  const navigate = useNavigate();
  const [dateFilter, setDateFilter] = useState('all');
  const [activityFilter, setActivityFilter] = useState('all');

  // Mock user data
  const userData = {
    name: "Sarah Johnson",
    avatar: "<https://images.unsplash.com/photo-1494790108377-be9c29b29330>",
    joinDate: "January 2024",
    totalIdeas: 12,
    votesCast: 247,
    communityScore: 1850
  };

  // Mock submitted ideas
  const submittedIdeas = [
  {
    id: 1,
    title: "Community Garden Initiative",
    status: "active",
    upvotes: 142,
    downvotes: 23,
    comments: 18,
    submittedDate: "2024-12-15",
    ward: "Ward 3",
    topics: ["Environment", "Community"],
    image: "https://images.unsplash.com/photo-1503425049645-16cd689dda99",
    imageAlt: "Vibrant community garden with raised wooden beds filled with green vegetables and colorful flowers"
  },
  {
    id: 2,
    title: "Bike Lane Expansion Project",
    status: "pending",
    upvotes: 89,
    downvotes: 34,
    comments: 12,
    submittedDate: "2024-12-10",
    ward: "Ward 5",
    topics: ["Transportation", "Environment"],
    image: "https://images.unsplash.com/photo-1685879682316-9bace8a06dc2",
    imageAlt: "Wide protected bike lane with green painted surface and white bicycle symbols"
  },
  {
    id: 3,
    title: "Youth Sports Complex",
    status: "implemented",
    upvotes: 256,
    downvotes: 45,
    comments: 34,
    submittedDate: "2024-11-20",
    ward: "Ward 2",
    topics: ["Recreation", "Youth"],
    image: "https://img.rocket.new/generatedImages/rocket_gen_img_103b27222-1765060794116.png",
    imageAlt: "Modern outdoor sports complex with soccer field and running track"
  }];

  // Mock voting history
  const votingHistory = [
  {
    id: 1,
    ideaTitle: "Free Public WiFi Zones",
    voteType: "upvote",
    votedDate: "2024-12-18",
    ward: "Ward 1",
    currentUpvotes: 287,
    currentDownvotes: 45,
    image: "https://images.unsplash.com/photo-1711591140563-a9373b5d3cf8",
    imageAlt: "Modern public park with people using laptops and smartphones under trees"
  },
  {
    id: 2,
    ideaTitle: "Monthly Farmers Market",
    voteType: "upvote",
    votedDate: "2024-12-17",
    ward: "Ward 4",
    currentUpvotes: 203,
    currentDownvotes: 28,
    image: "https://img.rocket.new/generatedImages/rocket_gen_img_1227712f7-1764915815373.png",
    imageAlt: "Bustling farmers market with colorful produce stands and shoppers"
  },
  {
    id: 3,
    ideaTitle: "Street Art Beautification",
    voteType: "downvote",
    votedDate: "2024-12-16",
    ward: "Ward 6",
    currentUpvotes: 134,
    currentDownvotes: 89,
    image: "https://images.unsplash.com/photo-1714718404796-c76ffe67cfa3",
    imageAlt: "Colorful street art mural on urban building wall"
  },
  {
    id: 4,
    ideaTitle: "Senior Center Renovation",
    voteType: "upvote",
    votedDate: "2024-12-14",
    ward: "Ward 3",
    currentUpvotes: 178,
    currentDownvotes: 23,
    image: "https://img.rocket.new/generatedImages/rocket_gen_img_1933039d5-1764837341308.png",
    imageAlt: "Modern senior center interior with comfortable seating and natural light"
  }];

  // Mock community stats
  const communityStats = {
    participationTrend: [
    { month: "Jul", votes: 45, ideas: 2 },
    { month: "Aug", votes: 62, ideas: 3 },
    { month: "Sep", votes: 58, ideas: 1 },
    { month: "Oct", votes: 71, ideas: 4 },
    { month: "Nov", votes: 89, ideas: 2 },
    { month: "Dec", votes: 95, ideas: 3 }],

    wardInvolvement: [
    { ward: "Ward 1", count: 42 },
    { ward: "Ward 2", count: 38 },
    { ward: "Ward 3", count: 56 },
    { ward: "Ward 4", count: 31 },
    { ward: "Ward 5", count: 45 },
    { ward: "Ward 6", count: 35 }],

    topicPreferences: [
    { topic: "Environment", count: 67 },
    { topic: "Transportation", count: 54 },
    { topic: "Community", count: 48 },
    { topic: "Technology", count: 39 },
    { topic: "Recreation", count: 39 }]

  };

  const handleIdeaClick = (ideaId) => {
    navigate('/idea-detail-view', { state: { ideaId } });
  };

  return (
    <div className="min-h-screen bg-background">
      <Header />

      <main className="pt-20 lg:pt-24 pb-12">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-12">
          {/* User Stats Header */}
          <UserStatsHeader userData={userData} />

          {/* Filter Controls */}
          <div className="mb-8 flex flex-col sm:flex-row gap-4 items-start sm:items-center justify-between">
            <div className="flex items-center gap-3">
              <Icon name="Filter" size={20} color="var(--color-muted-foreground)" />
              <span className="text-sm font-medium text-muted-foreground">Filter by:</span>
            </div>
            <div className="flex flex-wrap gap-3">
              <select
                value={dateFilter}
                onChange={(e) => setDateFilter(e?.target?.value)}
                className="px-4 py-2 rounded-lg border border-border bg-card text-sm font-medium text-foreground focus:outline-none focus:ring-2 focus:ring-primary">

                <option value="all">All Time</option>
                <option value="week">Last Week</option>
                <option value="month">Last Month</option>
                <option value="year">Last Year</option>
              </select>
              <select
                value={activityFilter}
                onChange={(e) => setActivityFilter(e?.target?.value)}
                className="px-4 py-2 rounded-lg border border-border bg-card text-sm font-medium text-foreground focus:outline-none focus:ring-2 focus:ring-primary">

                <option value="all">All Activity</option>
                <option value="ideas">Ideas Only</option>
                <option value="votes">Votes Only</option>
              </select>
            </div>
          </div>

          {/* Dashboard Sections */}
          <div className="space-y-8">
            {/* My Ideas Section */}
            {(activityFilter === 'all' || activityFilter === 'ideas') &&
            <MyIdeasSection
              ideas={submittedIdeas}
              onIdeaClick={handleIdeaClick} />

            }

            {/* Voting History Section */}
            {(activityFilter === 'all' || activityFilter === 'votes') &&
            <VotingHistorySection
              votingHistory={votingHistory}
              onIdeaClick={handleIdeaClick} />

            }

            {/* Community Stats Section */}
            <CommunityStatsSection stats={communityStats} />
          </div>
        </div>
      </main>
    </div>);

};

export default UserProfileDashboard;

# components

    # CommunityStatsSection.jsx
import React, { useState } from 'react';
import Icon from '../../../components/AppIcon';

const CommunityStatsSection = ({ stats }) => {
  const [expandedSection, setExpandedSection] = useState(true);

  const maxParticipation = Math.max(...stats?.participationTrend?.map(d => Math.max(d?.votes, d?.ideas)));
  const maxWardCount = Math.max(...stats?.wardInvolvement?.map(d => d?.count));
  const maxTopicCount = Math.max(...stats?.topicPreferences?.map(d => d?.count));

  return (
    <section className="bg-card rounded-xl shadow-elevation-3 border border-border overflow-hidden">
      {/*Section Header*/}
      <div
        className="flex items-center justify-between p-6 cursor-pointer hover:bg-muted/5 transition-smooth"
        onClick={() => setExpandedSection(!expandedSection)}
      >
        <div className="flex items-center gap-3">
          <div className="w-10 h-10 rounded-lg bg-secondary/10 flex items-center justify-center">
            <Icon name="BarChart3" size={20} color="var(--color-secondary)" />
          </div>
          <div>
            <h2 className="font-heading font-semibold text-xl text-foreground">Community Stats</h2>
            <p className="text-sm text-muted-foreground">Your participation insights</p>
          </div>
        </div>
        <Icon
          name={expandedSection ? "ChevronUp" : "ChevronDown"}
          size={24}
          color="var(--color-muted-foreground)"
        />
      </div>

      {/* Stats Content */}
      {expandedSection && (
        <div className="border-t border-border p-6 space-y-8">
          {/* Participation Trend */}
          <div>
            <h3 className="font-heading font-semibold text-base text-foreground mb-4 flex items-center gap-2">
              <Icon name="TrendingUp" size={18} color="var(--color-primary)" />
              Participation Trend
            </h3>
            <div className="space-y-3">
              {stats?.participationTrend?.map((data, index) => (
                <div key={index} className="space-y-1">
                  <div className="flex items-center justify-between text-sm">
                    <span className="font-medium text-foreground">{data?.month}</span>
                    <div className="flex items-center gap-3">
                      <span className="text-xs text-muted-foreground">
                        {data?.votes} votes · {data?.ideas} ideas
                      </span>
                    </div>
                  </div>
                  <div className="flex gap-1 h-2">
                    <div 
                      className="bg-success rounded-full transition-all"
                      style={{ width: `${(data?.votes / maxParticipation) * 100}%` }}
                    />
                    <div 
                      className="bg-primary rounded-full transition-all"
                      style={{ width: `${(data?.ideas / maxParticipation) * 100}%` }}
                    />
                  </div>
                </div>
              ))}
            </div>
            <div className="flex items-center gap-4 mt-4 text-xs">
              <div className="flex items-center gap-2">
                <div className="w-3 h-3 rounded-full bg-success" />
                <span className="text-muted-foreground">Votes</span>
              </div>
              <div className="flex items-center gap-2">
                <div className="w-3 h-3 rounded-full bg-primary" />
                <span className="text-muted-foreground">Ideas</span>
              </div>
            </div>
          </div>

          {/* Ward Involvement */}
          <div>
            <h3 className="font-heading font-semibold text-base text-foreground mb-4 flex items-center gap-2">
              <Icon name="MapPin" size={18} color="var(--color-primary)" />
              Ward Involvement
            </h3>
            <div className="space-y-3">
              {stats?.wardInvolvement?.map((data, index) => (
                <div key={index} className="space-y-1">
                  <div className="flex items-center justify-between text-sm">
                    <span className="font-medium text-foreground">{data?.ward}</span>
                    <span className="text-xs text-muted-foreground">{data?.count} interactions</span>
                  </div>
                  <div className="h-2 bg-muted rounded-full overflow-hidden">
                    <div 
                      className="h-full bg-primary rounded-full transition-all"
                      style={{ width: `${(data?.count / maxWardCount) * 100}%` }}
                    />
                  </div>
                </div>
              ))}
            </div>
          </div>

          {/* Topic Preferences */}
          <div>
            <h3 className="font-heading font-semibold text-base text-foreground mb-4 flex items-center gap-2">
              <Icon name="Tag" size={18} color="var(--color-primary)" />
              Topic Preferences
            </h3>
            <div className="space-y-3">
              {stats?.topicPreferences?.map((data, index) => (
                <div key={index} className="space-y-1">
                  <div className="flex items-center justify-between text-sm">
                    <span className="font-medium text-foreground">{data?.topic}</span>
                    <span className="text-xs text-muted-foreground">{data?.count} engagements</span>
                  </div>
                  <div className="h-2 bg-muted rounded-full overflow-hidden">
                    <div 
                      className="h-full bg-secondary rounded-full transition-all"
                      style={{ width: `${(data?.count / maxTopicCount) * 100}%` }}
                    />
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>
      )}
    </section>
  );
};

export default CommunityStatsSection;
    # IdeaCard.jsx
import React from 'react';
import Image from '../../../components/AppImage';
import Icon from '../../../components/AppIcon';

const IdeaCard = ({ idea, onClick, statusColor, statusIcon }) => {
  const netVotes = idea?.upvotes - idea?.downvotes;

  return (
    <div
      onClick={onClick}
      className="p-6 hover:bg-muted/5 transition-smooth cursor-pointer"
    >
      <div className="flex flex-col sm:flex-row gap-4">
        {/*Image*/}
        {idea?.image && (
          <div className="w-full sm:w-32 h-32 flex-shrink-0 rounded-lg overflow-hidden">
            <Image
              src={idea?.image}
              alt={idea?.imageAlt}
              className="w-full h-full object-cover"
            />
          </div>
        )}

        {/* Content */}
        <div className="flex-1 min-w-0">
          <div className="flex items-start justify-between gap-4 mb-2">
            <h3 className="font-heading font-semibold text-lg text-foreground line-clamp-1">
              {idea?.title}
            </h3>
            <div className={`flex items-center gap-1.5 px-3 py-1 rounded-full border ${statusColor} flex-shrink-0`}>
              <Icon name={statusIcon} size={14} />
              <span className="text-xs font-medium capitalize">{idea?.status}</span>
            </div>
          </div>

          <div className="flex items-center gap-2 mb-3 flex-wrap">
            <div className="px-2.5 py-1 rounded-full bg-primary/10 border border-primary/20">
              <span className="text-xs font-medium text-primary">{idea?.ward}</span>
            </div>
            {idea?.topics?.map((topic, index) => (
              <span
                key={index}
                className="px-2.5 py-1 rounded-full bg-secondary/10 border border-secondary/20 text-xs font-medium text-secondary"
              >
                {topic}
              </span>
            ))}
          </div>

          <div className="flex items-center gap-4 flex-wrap">
            <div className="flex items-center gap-1.5">
              <Icon name="ThumbsUp" size={16} color="var(--color-success)" />
              <span className="text-sm font-medium text-foreground">{idea?.upvotes}</span>
            </div>
            <div className="flex items-center gap-1.5">
              <Icon name="ThumbsDown" size={16} color="var(--color-muted-foreground)" />
              <span className="text-sm font-medium text-foreground">{idea?.downvotes}</span>
            </div>
            <div className="flex items-center gap-1.5">
              <Icon name="MessageCircle" size={16} color="var(--color-muted-foreground)" />
              <span className="text-sm font-medium text-foreground">{idea?.comments}</span>
            </div>
            <div className="ml-auto flex items-center gap-1.5 px-3 py-1 rounded-full bg-muted">
              <Icon name="TrendingUp" size={14} color="var(--color-primary)" />
              <span className="text-sm font-medium text-foreground">{netVotes > 0 ? '+' : ''}{netVotes}</span>
            </div>
          </div>

          <div className="mt-3 flex items-center gap-2 text-xs text-muted-foreground">
            <Icon name="Calendar" size={14} color="var(--color-muted-foreground)" />
            <span>Submitted {new Date(idea?.submittedDate)?.toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' })}</span>
          </div>
        </div>
      </div>
    </div>
  );
};

export default IdeaCard;

    # MyIdeasSection.jsx
import React, { useState } from 'react';
import Icon from '../../../components/AppIcon';
import IdeaCard from './IdeaCard';

const MyIdeasSection = ({ ideas, onIdeaClick }) => {
  const [expandedSection, setExpandedSection] = useState(true);

  const getStatusColor = (status) => {
    switch (status) {
      case 'active':
        return 'bg-success/10 text-success border-success/20';
      case 'pending':
        return 'bg-warning/10 text-warning border-warning/20';
      case 'implemented':
        return 'bg-primary/10 text-primary border-primary/20';
      default:
        return 'bg-muted/10 text-muted-foreground border-muted/20';
    }
  };

  const getStatusIcon = (status) => {
    switch (status) {
      case 'active':
        return 'Activity';
      case 'pending':
        return 'Clock';
      case 'implemented':
        return 'CheckCircle2';
      default:
        return 'Circle';
    }
  };

  return (
    <section className="bg-card rounded-xl shadow-elevation-3 border border-border overflow-hidden">
      {/*Section Header*/}
      <div
        className="flex items-center justify-between p-6 cursor-pointer hover:bg-muted/5 transition-smooth"
        onClick={() => setExpandedSection(!expandedSection)}
      >
        <div className="flex items-center gap-3">
          <div className="w-10 h-10 rounded-lg bg-primary/10 flex items-center justify-center">
            <Icon name="Lightbulb" size={20} color="var(--color-primary)" />
          </div>
          <div>
            <h2 className="font-heading font-semibold text-xl text-foreground">My Ideas</h2>
            <p className="text-sm text-muted-foreground">{ideas?.length} submitted ideas</p>
          </div>
        </div>
        <Icon
          name={expandedSection ? "ChevronUp" : "ChevronDown"}
          size={24}
          color="var(--color-muted-foreground)"
        />
      </div>

      {/* Ideas List */}
      {expandedSection && (
        <div className="border-t border-border">
          {ideas?.length === 0 ? (
            <div className="p-12 text-center">
              <Icon name="Lightbulb" size={48} color="var(--color-muted-foreground)" className="mx-auto mb-4 opacity-50" />
              <p className="text-muted-foreground">You haven't submitted any ideas yet.</p>
            </div>
          ) : (
            <div className="divide-y divide-border">
              {ideas?.map((idea) => (
                <IdeaCard
                  key={idea?.id}
                  idea={idea}
                  onClick={() => onIdeaClick(idea?.id)}
                  statusColor={getStatusColor(idea?.status)}
                  statusIcon={getStatusIcon(idea?.status)}
                />
              ))}
            </div>
          )}
        </div>
      )}
    </section>
  );
};

export default MyIdeasSection;

    # UserStatsHeader.jsx
import React from 'react';
import Image from '../../../components/AppImage';
import Icon from '../../../components/AppIcon';

const UserStatsHeader = ({ userData }) => {
  return (
    <div className="bg-card rounded-xl shadow-elevation-3 border border-border p-6 lg:p-8 mb-8">
      <div className="flex flex-col sm:flex-row items-start sm:items-center gap-6">
        {/*Avatar*/}
        <div className="relative">
          <div className="w-20 h-20 lg:w-24 lg:h-24 rounded-full overflow-hidden border-4 border-primary/20">
            <Image
              src={userData?.avatar}
              alt={`${userData?.name} profile picture`}
              className="w-full h-full object-cover"
            />
          </div>
          <div className="absolute -bottom-1 -right-1 w-8 h-8 bg-success rounded-full border-4 border-card flex items-center justify-center">
            <Icon name="Check" size={14} color="#ffffff" />
          </div>
        </div>

        {/* User Info */}
        <div className="flex-1">
          <h1 className="font-heading font-bold text-2xl lg:text-3xl text-foreground mb-1">
            {userData?.name}
          </h1>
          <div className="flex items-center gap-2 text-sm text-muted-foreground mb-4">
            <Icon name="Calendar" size={16} color="var(--color-muted-foreground)" />
            <span>Member since {userData?.joinDate}</span>
          </div>

          {/* Stats Grid */}
          <div className="grid grid-cols-3 gap-4 lg:gap-6">
            <div className="bg-primary/5 rounded-lg p-3 lg:p-4 border border-primary/10">
              <div className="flex items-center gap-2 mb-1">
                <Icon name="Lightbulb" size={18} color="var(--color-primary)" />
                <span className="text-xs lg:text-sm font-medium text-muted-foreground">Ideas</span>
              </div>
              <p className="font-heading font-bold text-xl lg:text-2xl text-foreground">
                {userData?.totalIdeas}
              </p>
            </div>

            <div className="bg-success/5 rounded-lg p-3 lg:p-4 border border-success/10">
              <div className="flex items-center gap-2 mb-1">
                <Icon name="Vote" size={18} color="var(--color-success)" />
                <span className="text-xs lg:text-sm font-medium text-muted-foreground">Votes</span>
              </div>
              <p className="font-heading font-bold text-xl lg:text-2xl text-foreground">
                {userData?.votesCast}
              </p>
            </div>

            <div className="bg-secondary/5 rounded-lg p-3 lg:p-4 border border-secondary/10">
              <div className="flex items-center gap-2 mb-1">
                <Icon name="TrendingUp" size={18} color="var(--color-secondary)" />
                <span className="text-xs lg:text-sm font-medium text-muted-foreground">Impact</span>
              </div>
              <p className="font-heading font-bold text-xl lg:text-2xl text-foreground">
                {userData?.communityScore?.toLocaleString()}
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default UserStatsHeader;

    # VoteHistoryCard.jsx
import React from 'react';
import Image from '../../../components/AppImage';
import Icon from '../../../components/AppIcon';

const VoteHistoryCard = ({ vote, onClick }) => {
  const isUpvote = vote?.voteType === 'upvote';
  const netVotes = vote?.currentUpvotes - vote?.currentDownvotes;

  return (
    <div
      onClick={onClick}
      className="p-6 hover:bg-muted/5 transition-smooth cursor-pointer"
    >
      <div className="flex flex-col sm:flex-row gap-4">
        {/*Image*/}
        {vote?.image && (
          <div className="w-full sm:w-32 h-32 flex-shrink-0 rounded-lg overflow-hidden">
            <Image
              src={vote?.image}
              alt={vote?.imageAlt}
              className="w-full h-full object-cover"
            />
          </div>
        )}

        {/* Content */}
        <div className="flex-1 min-w-0">
          <div className="flex items-start gap-3 mb-2">
            <div className={`w-8 h-8 rounded-full flex items-center justify-center flex-shrink-0 ${
              isUpvote ? 'bg-success/10' : 'bg-error/10'
            }`}>
              <Icon 
                name={isUpvote ? "ThumbsUp" : "ThumbsDown"} 
                size={16} 
                color={isUpvote ? "var(--color-success)" : "var(--color-error)"}
              />
            </div>
            <div className="flex-1 min-w-0">
              <h3 className="font-heading font-semibold text-lg text-foreground line-clamp-1 mb-1">
                {vote?.ideaTitle}
              </h3>
              <div className="flex items-center gap-2 text-xs text-muted-foreground">
                <Icon name="Calendar" size={14} color="var(--color-muted-foreground)" />
                <span>Voted {new Date(vote?.votedDate)?.toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' })}</span>
                <span>·</span>
                <span>{vote?.ward}</span>
              </div>
            </div>
          </div>

          <div className="flex items-center gap-4 mt-3">
            <div className="flex items-center gap-1.5">
              <Icon name="ThumbsUp" size={16} color="var(--color-success)" />
              <span className="text-sm font-medium text-foreground">{vote?.currentUpvotes}</span>
            </div>
            <div className="flex items-center gap-1.5">
              <Icon name="ThumbsDown" size={16} color="var(--color-muted-foreground)" />
              <span className="text-sm font-medium text-foreground">{vote?.currentDownvotes}</span>
            </div>
            <div className="ml-auto flex items-center gap-1.5 px-3 py-1 rounded-full bg-muted">
              <Icon name="TrendingUp" size={14} color="var(--color-primary)" />
              <span className="text-sm font-medium text-foreground">{netVotes > 0 ? '+' : ''}{netVotes}</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default VoteHistoryCard;

    # VotingHistorySec
import React, { useState } from 'react';
import Icon from '../../../components/AppIcon';
import VoteHistoryCard from './VoteHistoryCard';

const VotingHistorySection = ({ votingHistory, onIdeaClick }) => {
  const [expandedSection, setExpandedSection] = useState(true);

  const upvoteCount = votingHistory?.filter(v => v?.voteType === 'upvote')?.length;
  const downvoteCount = votingHistory?.filter(v => v?.voteType === 'downvote')?.length;

  return (
    <section className="bg-card rounded-xl shadow-elevation-3 border border-border overflow-hidden">
      {/*Section Header*/}
      <div
        className="flex items-center justify-between p-6 cursor-pointer hover:bg-muted/5 transition-smooth"
        onClick={() => setExpandedSection(!expandedSection)}
      >
        <div className="flex items-center gap-3">
          <div className="w-10 h-10 rounded-lg bg-success/10 flex items-center justify-center">
            <Icon name="Vote" size={20} color="var(--color-success)" />
          </div>
          <div>
            <h2 className="font-heading font-semibold text-xl text-foreground">Voting History</h2>
            <p className="text-sm text-muted-foreground">
              {upvoteCount} upvotes · {downvoteCount} downvotes
            </p>
          </div>
        </div>
        <Icon
          name={expandedSection ? "ChevronUp" : "ChevronDown"}
          size={24}
          color="var(--color-muted-foreground)"
        />
      </div>

      {/* Voting History Timeline */}
      {expandedSection && (
        <div className="border-t border-border">
          {votingHistory?.length === 0 ? (
            <div className="p-12 text-center">
              <Icon name="Vote" size={48} color="var(--color-muted-foreground)" className="mx-auto mb-4 opacity-50" />
              <p className="text-muted-foreground">You haven't voted on any ideas yet.</p>
            </div>
          ) : (
            <div className="divide-y divide-border">
              {votingHistory?.map((vote) => (
                <VoteHistoryCard
                  key={vote?.id}
                  vote={vote}
                  onClick={() => onIdeaClick(vote?.id)}
                />
              ))}
            </div>
          )}
        </div>
      )}
    </section>
  );
};

export default VotingHistorySection;

# NotFound.jsx*

import React from 'react';
import { useNavigate } from 'react-router-dom';
import Button from 'components/ui/Button';
import Icon from 'components/AppIcon';

const NotFound = () => {
  const navigate = useNavigate();

  const handleGoHome = () => {
    navigate('/');
  };

  return (
    <div className="min-h-screen flex flex-col items-center justify-center bg-background p-4">
      <div className="text-center max-w-md">
        <div className="flex justify-center mb-6">
          <div className="relative">
            <h1 className="text-9xl font-bold text-primary opacity-20">404</h1>
          </div>
        </div>

        <h2 className="text-2xl font-medium text-onBackground mb-2">Page Not Found</h2>
        <p className="text-onBackground/70 mb-8">
          The page you're looking for doesn't exist. Let's get you back!
        </p>

        <div className="flex flex-col sm:flex-row gap-4 justify-center">
          <Button
            variant="primary"
            icon={<Icon name="ArrowLeft" />}
            iconPosition="left"
            onClick={() => window.history?.back()}
          >
            Go Back
          </Button>

          <Button
            variant="outline"
            icon={<Icon name="Home" />}
            iconPosition="left"
            onClick={handleGoHome}
          >
            Back to Home
          </Button>
        </div>
      </div>
    </div>
  );
};

export default NotFound;
