class Difficulty {
    private float collisionRadius;

    Difficulty(float radius) {
        setCollisionRadius(radius);
    }

    public float getCollisionRadius() {
        return collisionRadius;
    }

    public void setCollisionRadius(float radius) {
        this.collisionRadius = radius;
    }
}
