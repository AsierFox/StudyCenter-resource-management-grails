package app

/**
 * The computer model.
 */
class Computer {

    String ipAddress
    String name

    Collection components

    static hasMany = [components: Component]

    static constraints = {
        ipAddress(unique: true)
        name(unique: true)
    }

    /**
     * Returns all the Software components.
     */
    def getSoftware() {
        components.split {
            Software.class.isAssignableFrom(it.getClass())
        }[0]
    }

    /**
     * Returns all the Hardware components.
     */
    def getHardware() {
        components.split {
            Hardware.class.isAssignableFrom(it.getClass())
        }[0]
    }

    /**
     * Returns all the Ram memory capacity in Gigabytes.
     */
    def getMemoryCapacity() {
        int totalCapacity = 0
        Collection rams = components.split {
            Ram.class.isAssignableFrom(it.getClass())
        }[0]

        if (rams) {
            rams.split { totalCapacity += it.capacity }
        }
        totalCapacity
    }

    def getActualStorage() {}

    /**
     * Returns the total storage capacity in Gigabytes.
     */
    def getTotalStorage() {
        int totalStorage = 0
        Collection hardDrives = components.split {
            HardDrive.class.isAssignableFrom(it.getClass())
        }[0]

        if (hardDrives) {
            hardDrives.split { totalStorage += it.storage }
        }
        totalStorage
    }

    def getRemainingStorage() {}

}
